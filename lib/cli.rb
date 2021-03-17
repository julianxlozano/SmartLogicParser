require_relative '../config/environment.rb'

class CLI

 
def self.input

    red= "Roses are Red,".colorize(:red)
    blue= " Violets are...".colorize(:blue)
    puts red + blue 
    puts "\nEnter a word to finish the poem!\n".colorize(:yellow)

    input = gets.chomp.strip 
    puts "Hold up, I'm thinking of a good one...\n".colorize(:yellow)
    rhyme_word = API.get_rhyme_word(input)
    
    input_after

   
end


def self.input_after

    puts "\nTo see a list of all previous poems type 'poem history'" 
    puts "\nTo start a new poem type: 'new poem'"
    puts "\nTo end session type: 'exit'"
    
    input_2 = gets.strip 
    
    case 
    when input_2 == "poem history" then self.poem_history
    when input_2 == "new poem" then self.input 
    when input_2 == "exit" then ascii_peace
    when input_2 != "poem history" || input_2 != "new poem" ||  input_2 != "exit" then input_after 
    end
 
    


end


def self.poem_history 

    Poem.all.each.with_index(1){|poem,index|  puts "\n#{index}. \n \"#{poem.name}\" \n #{poem.text}".colorize(:yellow) }

    input_after


end

def self.render_ascii_art
  puts "
  ██████╗  ██████╗ ███████╗███╗   ███╗     ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ████████╗ ██████╗ ██████╗ 
  ██╔══██╗██╔═══██╗██╔════╝████╗ ████║    ██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
  ██████╔╝██║   ██║█████╗  ██╔████╔██║    ██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║   ██║   ██║   ██║██████╔╝
  ██╔═══╝ ██║   ██║██╔══╝  ██║╚██╔╝██║    ██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║   ██║   ██║   ██║██╔══██╗
  ██║     ╚██████╔╝███████╗██║ ╚═╝ ██║    ╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║   ██║   ╚██████╔╝██║  ██║
  ╚═╝      ╚═════╝ ╚══════╝╚═╝     ╚═╝     ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
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