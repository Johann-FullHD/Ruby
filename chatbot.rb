# chatbot.rb

class Chatbot
  def initialize(name)
    @name = name
    @intents = {
      greeting: ['hello', 'hi', 'hey', 'hola', 'hi there'],
      goodbye: ['bye', 'goodbye', 'ee you later', 'adios'],
      thanks: ['thank you', 'thanks', 'appreciate it'],
      help: ['help', 'what can you do', 'how can you assist me']
    }
    @responses = {
      greeting: ["Hello! I'm #{@name}.", "Hi there! I'm #{@name}.", "Hey! I'm #{@name}.", "Hola! I'm #{@name}.", "Hi! I'm #{@name}.", "Hey there! I'm #{@name}.", "Hi #{@name}!"],
      goodbye: ['Goodbye!', 'See you later!', 'Adios!', 'Bye for now!'],
      thanks: ['You\'re welcome!', 'No problem!', 'Anytime!'],
      help: ["I can assist you with various tasks. What do you need help with?", "I can help you with anything from answering questions to generating text. What's on your mind?", "I'm here to help. What do you need assistance with?"]
    }
  end

  def get_intent(message)
    @intents.each do |intent, keywords|
      keywords.each do |keyword|
        return intent if message.downcase.include?(keyword)
      end
    end
    :unknown
  end

  def respond(message)
    intent = get_intent(message)
    if intent!= :unknown
      responses = @responses[intent]
      responses.sample
    else
      'I didn\'t understand that. Can you please rephrase?'
    end
  end
end

def main
  chatbot = Chatbot.new('Assistant')
  puts 'Welcome to the chatbot!'
  loop do
    print 'You: '
    message = gets.chomp
    response = chatbot.respond(message)
    puts "#{chatbot.instance_variable_get(:@name)}: #{response}"
    break if chatbot.get_intent(message) == :goodbye
  end
end

main