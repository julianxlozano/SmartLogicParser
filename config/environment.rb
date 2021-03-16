require 'bundler/setup'
require 'net/http'
 require 'open-uri'
 require 'uri'
 require 'json'

 require_relative '../lib/api.rb'
 require_relative '../lib/poem.rb'
 require_relative '../lib/cli.rb'


Bundler.require(:default,:development)