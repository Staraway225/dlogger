# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)
require "dlogger/version"
require "date"

Gem::Specification.new do |s|
  s.name        = "dlogger"
  s.version     = DLogger::VERSION
  s.date        = Date.today.to_s
  s.summary     = "Remote logger using DRb."
  s.description = "A Distributed Ruby (DRb) wrapper around default Ruby logger."
  s.homepage    = "https://github.com/Staraway225/dlogger"
  s.authors     = ["Aleksei Gostev"]
  s.email       = ["starawayy@protonmail.com"]
  s.license     = "ISC"
  s.required_ruby_version = ">= 2.6.0"
  s.metadata = {
    "homepage_uri" => "https://github.com/Staraway225/dlogger",
    "source_code_uri" => "https://github.com/Staraway225/dlogger",
    "bug_tracker_uri" => "https://github.com/Staraway225/dlogger/issues"
  }

  s.files = Dir["{lib}/**/*", "LICENSE", "README.md"]
end
