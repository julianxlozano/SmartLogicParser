require 'bundler/setup'
require 'net/http'
 require 'open-uri'
 require 'uri'
 require 'json'

 require_relative '../lib/parser.rb'
 require_relative '../lib/record.rb'
 require_relative '../lib/cli.rb'


Bundler.require(:default,:development)