# frozen_string_literal: true

module DLogger
  # Host class that initializes DRb service and creates a shared logger object.
  class Host
    DEFAULT_INTERNAL_FORMATTER = proc { |_, _, pname, msg| "[#{pname}] #{msg}\n" }
    DEFAULT_REMOTE_FORMATTER =
      proc do |severity, datetime, pname, msg|
        pname = "#{pname}: " if pname
        client_addr = Thread.current["DRb"]["client"]&.peeraddr
        client_addr_str = client_addr ? "#{client_addr[2]}:#{client_addr[1]}" : "unknown"
        "#{client_addr_str} | [#{severity}] [#{datetime}] -- #{pname}#{msg.dump}\n"
      end

    def initialize(
      port: "22500",
      logdev: $stdout,
      level: Logger::INFO,
      progname: nil,
      formatter: DEFAULT_REMOTE_FORMATTER
    )
      @uri = "druby://localhost:#{port}"
      @internal_logger =
        Logger.new($stdout, progname: "DLogger", formatter: DEFAULT_INTERNAL_FORMATTER)
      @remote_logger = Logger.new(logdev, level: level, progname: progname, formatter: formatter)
    end

    def start
      DRb.start_service(@uri, @remote_logger)
      @internal_logger.info("Ready.")

      begin
        DRb.thread.join
      rescue Interrupt
        puts "\n"
        @internal_logger.info("Stopping DRb service...")
        DRb.stop_service
        @internal_logger.info("Done.")
      end
    end
  end
end
