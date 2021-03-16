require_relative '../config/environment.rb'

class CLI

   #@@status = "in progress"

   #def self.status=(status)
    #@@status
   #end

def self.input

    puts "Roses are Red, Violets are..."
    puts "Enter a word to finish the poem!\n"

    input = gets.chomp.strip 
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
    when input_2 == "exit" then puts "Hopefully we can spit some more fire soon, Peace."
    when input_2 != "poem history" || input_2 != "new poem" ||  input_2 != "exit" then input_after 
    end
 
    


end


def self.poem_history 

    Poem.all.each.with_index(1){|poem,index|  puts "#{index}. \n \"#{poem.name}\" \n #{poem.text}" }

    input_after


end





end