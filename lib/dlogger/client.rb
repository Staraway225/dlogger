# frozen_string_literal: true

module DLogger
  # Client class that initializes remote DRb sevice and remote logger object.
  class Client
    def initialize(host: "localhost", port: "22500")
      @host = host
      @port = port
    end

    def start
      DRb.start_service
      @remote_logger = DRbObject.new_with_uri("druby://#{@host}:#{@port}")
    end

    def stop
      DRb.stop_service
    end

    def logger
      @remote_logger
    end
  end
end
