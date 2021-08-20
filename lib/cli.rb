require_relative '../config/environment.rb'

class CLI

  @@records = Record.all  
 
def self.input

    puts "\nHello weary traveler! Would you like some human data?\n".colorize(:yellow)
    puts "\nI can organize it in 3 ways:\n".colorize(:yellow)
    puts "\nTo sort by gender, type 'g'" 
    puts "\nTo sort by birth date, type 'b'"
    puts "\nTo sort by last name (descending), type: 'l'"
    puts "\nType 'exit' to get outta here.".colorize(:red)

    input = gets.chomp.strip 
    puts "You got it.\n".colorize(:yellow)
    

    case input
      when "g" then self.sort_by_gender
      when "b" then self.sort_by_birthdate
      when "l" then self.sort_by_lastname_desc
      when "exit" then ascii_peace
    end

   
    self.input
   
end


def self.sort_by_gender
  #  records = Record.all 
    gender_sorted = @@records.sort_by{|record|[record.gender,record.lastname]}
    gender_sorted.each do |record|
        puts "#{record.lastname} #{record.firstname} #{record.gender} #{record.bday} #{record.favorite_color}"
    end
end

def self.sort_by_birthdate
 #  records = Record.all 
   birthday_sorted = @@records.sort_by{|r|[r.date_of_birth,r.lastname]} 
   birthday_sorted.each{|record| puts "#{record.lastname} #{record.firstname} #{record.gender} #{record.bday} #{record.favorite_color}"}
end


def self.sort_by_lastname_desc
  # records = Record.all 
  lastname_sorted = @@records.sort_by{|r|r.lastname}.reverse 
  lastname_sorted.each{|record| puts "#{record.lastname} #{record.firstname} #{record.gender} #{record.bday} #{record.favorite_color}"}
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
    puts "\nTil' we meet again, traveller.".colorize(:yellow)
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
  JXL |      |
    ".colorize(:yellow)

    exit! 
  end 





end