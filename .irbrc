require 'rubygems'
require 'irb/completion'
#require 'wirble'
#require 'hirb'

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:PROMPT_MODE] = :SIMPLE

alias q exit

module Kernel
  def cleandb
    DatabaseCleaner.clean
  end
end
#Colorize results
#begin
  #Wirble.init
  #Wirble.colorize
#rescue LoadError
  #puts "Error loading Wirble. Run 'sudo gem install wirble' to enable colorized results."
#end

#Hirb.enable if defined?(Rails)

#require 'ap'
#IRB::Irb.class_eval do
  #def output_value
    #ap @context.last_value, :multiline => false
  #end
#end

