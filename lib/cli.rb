require_relative '../config/environment.rb'

class CLI

 
def self.input


    puts "\nHello weary traveler! Would you like some human data?\n".colorize(:yellow)
    puts "\nI can organize it in 3 ways:\n".colorize(:yellow)
    puts "\nTo sort by gender, type 'g'" 
    puts "\nTo sort by birth date, type 'b'"
    puts "\nTo sort by last name (descending), type: 'l'"

    input = gets.chomp.strip 

    case 
      when input_2 == "poem history" then self.poem_history
      when input_2 == "new poem" then self.input 
      when input_2 == "exit" then ascii_peace
      when input_2 != "poem history" || input_2 != "new poem" ||  input_2 != "exit" then input_after 
    end

    puts "You got it, boss. Coming right up!\n".colorize(:yellow)
   # Parser.slice_and_dice
    
    input_after

   
end


def self.input_after

  

end




def self.render_ascii_art
  puts "
  ██████╗  █████╗ ██████╗ ███████╗███████╗    ██████╗  █████╗ ██████╗ ████████╗███╗   ██╗███████╗██████╗ 
  ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝    ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝████╗  ██║██╔════╝██╔══██╗
  ██████╔╝███████║██████╔╝███████╗█████╗      ██████╔╝███████║██████╔╝   ██║   ██╔██╗ ██║█████╗  ██████╔╝
  ██╔═══╝ ██╔══██║██╔══██╗╚════██║██╔══╝      ██╔═══╝ ██╔══██║██╔══██╗   ██║   ██║╚██╗██║██╔══╝  ██╔══██╗
  ██║     ██║  ██║██║  ██║███████║███████╗    ██║     ██║  ██║██║  ██║   ██║   ██║ ╚████║███████╗██║  ██║
  ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                                                                                                         
  ".colorize(:yellow)
  end

  def self.ascii_peace
    puts "\nHopefully we can spit some more fire soon, Peace.".colorize(:yellow)
    puts " 
    
    .''.    .'',
    |  |   /  /
    |  |  /  /
    |  | /  /
    |  |/  ;-._
    }  ` _/  / ;
    |  /` ) /  /
    | /  /_/\_/\
    |/  /      |
    (  ' \ '-  |
     \    `.  /
      |      |
  jxl |      |
    ".colorize(:yellow)

    exit! 
  end 





end