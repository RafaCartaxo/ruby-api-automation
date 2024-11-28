require 'cucumber'
require 'faker'
require 'httparty'
require 'json'
require 'jsonpath'
require 'json-schema'
require 'pry'
require 'yaml'
require_relative 'page_objects'
require_relative "log.rb"
require_relative "load_file.rb"

World(PageObjects)
World(Log)
World(LoadFile)

ENVIRONMENT_TYPE ||= ENV['ENVIRONMENT_TYPE']
CONFIG = YAML.load_file("./features/support/config/#{ENV['ENVIRONMENT_TYPE']}.yml")