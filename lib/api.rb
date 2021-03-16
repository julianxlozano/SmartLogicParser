require_relative '../config/environment.rb'

 class API 


 
 def self.get_rhyme_word(input_word)
    url= "https://api.datamuse.com/words?rel_rhy=#{input_word}"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
      new_word = JSON.parse(response.body)
      if new_word.empty?
        puts "Please enter a valid english word."
        CLI.input 
      else

        #for future syllable-matching functionality 
     # rhyme_collection=  new_word.select do |word_obj|
      #  word_obj['numSyllables'] >= 1 
       # end

     final_word= new_word.sample["word"]

  
     unless final_word.include?(" ")
       self.get_sentence(input_word,final_word) 
     else
        get_rhyme_word(input_word)
     end
   end 
  end 


#lsdkldk
#Now, we're debugging why it shows "enter a valid english word" after we enter an invalid word, followed by a valid word on the next time around. JOIN ME ON THIS JOURNEY!!!!

  def self.get_sentence(word,rhyme_word)

  #  binding.pry 
   uri = URI.parse("https://api.openai.com/v1/engines/davinci/completions")
   request = Net::HTTP::Post.new(uri)
   request.content_type = "application/json"
   request["Authorization"] = "Bearer sk-sHsIXbmHAVMGGoQa89dCORExsp7g46DwbiFb4HRD"
   request.body = JSON.dump({
   "prompt" => "Write a sentence that ends with \"time\":
   I went to the fair one time.
   Write a sentence that ends with \"run\":
   Let's go for a run!
   Write a sentence that ends with \"joyful\":
   You have made me very joyful.
   Write a sentence that ends with \"again\":
   He came back again.
   Write a sentence that ends with \"#{rhyme_word}\":",
   "max_tokens" => 20 
    })

   # binding.pry 
   if rhyme_word == nil
      puts "Please enter a valid english word2."
      CLI.input 
    else
   req_options = {
   use_ssl: uri.scheme == "https",
    }
   response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
   http.request(request)
   end
   parsed = JSON.parse(response.body) 
   raw_sentence = parsed["choices"][0]["text"]
   if raw_sentence.split.last == "#{rhyme_word}." 

   new_poem = Poem.new("#{rhyme_word}","Roses are red violets are #{word} \n #{raw_sentence}")

        puts "Roses are red, Violets are #{word}"
        puts raw_sentence 
        
   else  #was elsif
   raw_sentence_2 = raw_sentence.split(/[!.?]/)
   raw_sentence_3 = raw_sentence_2[0].split
   
        if raw_sentence_3.last == rhyme_word
          raw_sentence_4 = raw_sentence_3.join(" ") 
          new_poem = Poem.new("#{rhyme_word}","Roses are red violets are #{word} \n #{raw_sentence_4}")    
           puts "Roses are red, Violets are #{word}"
            puts raw_sentence_4 
             
        else
            get_sentence(word,rhyme_word)
        end
   end 
  end
  end
end 