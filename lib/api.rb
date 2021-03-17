require_relative '../config/environment.rb'

class API 
 def self.get_rhyme_word(input_word)
  url= "https://api.datamuse.com/words?rel_rhy=#{input_word}"
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)
  response.body
  new_word = JSON.parse(response.body)
    #If someone enters an invalid word, our response body will be an empty array.
    #So, we check against that. 
    if new_word.empty?
      puts "Please enter a valid english word."
      CLI.input 
    else
      #new_word is a array of hashes containing several possible rhymes.
      #.sample chooses one of those rhymes to surpise our user. 
      final_word= new_word.sample["word"]
      #I was getting bad results if the word contained white space, so I just nixed that. 
    unless final_word.include?(" ")
      self.get_sentence(input_word,final_word) 
    else
      get_rhyme_word(input_word)
    end
    end 
  end 

  def self.get_sentence(word,rhyme_word)
   uri = URI.parse("https://api.openai.com/v1/engines/davinci/completions")
   request = Net::HTTP::Post.new(uri)
   request.content_type = "application/json"
   request["Authorization"] = "Bearer sk-sHsIXbmHAVMGGoQa89dCORExsp7g46DwbiFb4HRD"
   #Here, I give GTP-3 a prompt so it understands the context of the pattern I'm asking for:
   #a sentence that ends with our rhyming word. 
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
   #the response goes through a "filter" to weed out possible "impurities" in the result
   #I notced that 30%-40% of the time, the AI did not place our word at the end of the sentence.
   #In order to control for these edge cases, I set up this control flow "filter": 
   if raw_sentence.split.last == "#{rhyme_word}." 
     new_poem = Poem.new("#{rhyme_word}","Roses are red violets are #{word} \n #{raw_sentence}")
     red= "Roses are red,".colorize(:red)
     violet=" Violets are #{word}".colorize(:blue)
     puts "\n#{red}#{violet}" 
     puts raw_sentence.colorize(:yellow)    
   else  
     raw_sentence_2 = raw_sentence.split(/[!.?]/)
     raw_sentence_3 = raw_sentence_2[0].split
      if raw_sentence_3.last == rhyme_word
        raw_sentence_4 = raw_sentence_3.join(" ") 
        new_poem = Poem.new("#{rhyme_word}","Roses are red violets are #{word} \n #{raw_sentence_4}")    
        red= "Roses are red,".colorize(:red)
        violet=" Violets are #{word}".colorize(:blue)
        puts "\n#{red}#{violet}" 
        puts raw_sentence_4.colorize(:yellow)     
      else
          #If the response doesn't fit the above criteria, it is unusable, and we tell the method to execute again.
          #Since the results have a higher probablity of succeding than failing, I was confident to implment it this way.
          #The only drawback to this implementation is the latency, and load times sometimes encountered.
          #However, as long as a word has a rhyme, our vigilant AI eventually gets it right. It just needs some patience and TLC. 
          get_sentence(word,rhyme_word)
      end
    end 
   end
  end
end 