require 'rubygems'
require 'sinatra'
require 'json'
require 'httparty'
require './lib/person'
require './app'

Bundler.require(:default, ENV['RACK_ENV']) if defined?(Bundler)
run Sinatra::Application
