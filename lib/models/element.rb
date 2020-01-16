class Element < ActiveRecord::Base

    has_many :characters
    has_many :moves

    def display_name
        case self.name
        when "Air Defense Artillary"
            puts "   Element: " + "#{self.name}".colorize(:color => :white, :background => :red) 
        when "Infantry"
            puts "   Element: " + "#{self.name}".colorize(:color => :white, :background => :green)
        when "Air Forces"
            puts "   Element: " + "#{self.name}".colorize(:color => :white, :background => :blue)
        end  
    end 


end