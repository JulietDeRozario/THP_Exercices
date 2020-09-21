require 'bundler'

Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'router.rb'
require 'controller.rb'
require 'gossip.rb'
require 'view.rb'

Router.new.perform