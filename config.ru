$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'rubygems'
require 'bundler/setup'
Bundler.require :default

require 'robut'
require 'ostruct'
require 'logger'

load './Chatfile'

Robut::Web.set :connection, Robut::Connection.new.connect
run Robut::Web
