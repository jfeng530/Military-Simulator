require_relative '../config/environment'
require 'pry'
require 'colorize'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

interface = Interface.new
interface.welcome

# binding.pry
puts "hello world"
