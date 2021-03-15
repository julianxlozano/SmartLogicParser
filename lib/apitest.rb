require_relative '../config/environment.rb'
require 'net/http'
 require 'open-uri'
 require 'uri'
 require 'json'



 #class GetRhymeWords

 def get_input
    puts "Choose a rhyme word"
    input=gets.chomp.strip
    get_rhyme_word(input)
    end
 
 
 def get_rhyme_word(input_word)
    url= "https://api.datamuse.com/words?rel_rhy=#{input_word}"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
      new_word = JSON.parse(response.body)
      if new_word.empty?
        puts "Please enter a valid english word."
        return
      else
      rhyme_collection=  new_word.select do |word_obj|
        word_obj['numSyllables'] >= 1 
       # word_obj["numSyllables"] == 2 || word_obj["numSyllables"] == 1 || word_obj["numSyllables"] == 3 || word_obj["numSyllables"] == 4 || word_obj["numSyllables"] == 5
        end
     final_word= rhyme_collection.sample["word"]
     unless final_word.include?(" ")
         final_word
     else
        get_rhyme_word(input_word)
     end
   end 
  end 



  def get_sentence(word)
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
   Write a sentence that ends with \"#{rhyme_word=get_rhyme_word(word)}\":",
   "max_tokens" => 20 
    })

    if rhyme_word == nil
      return #We will call our CLI input function here. Perhaps this should be in the body of get_rhyme_word? 
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
    puts "Roses are red, Violets are #{word}"
        puts raw_sentence 
   elsif 
   raw_sentence_2 = raw_sentence.split(/[!.?]/)
   raw_sentence_3 = raw_sentence_2[0].split 
        if raw_sentence_3.last == rhyme_word
          
          
            puts "Roses are red, Violets are #{word}"
            puts raw_sentence_3.join(" ") 
        else
            get_sentence(word)
        end
   end 
  end
  end

  # binding.pry 
   
   get_sentence("terrific")

#end 