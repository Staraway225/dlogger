# frozen_string_literal: true

require "../lib/dlogger"

client = DLogger::Client.new
client.start

10.times do |i|
  client.logger.info("Hello #{i}")
end

client.stop
