require_relative 'flashcards'
class Game
  attr_reader :deck 
  def initialize(deck)
    @deck = deck
  end

  def shuffle
    @deck.shuffle!
  end

  def show_definition
    puts @deck[0].definition
  end

  def deck_empty? 
    true if @deck.size == 0 
  end 


  def compare_answer(string)
    if @deck[0].term == string
      puts "NICE ANSWER!"
      @deck.shift
      return true
    else
      puts "INCORRECT!"
      return false
    end
  end

  def exit_game(string)
    true if string.downcase == "exit"
  end

  def check_answer(input) 
    puts "Guess:"
    compare_answer(input) unless false 
  end 

 
  def play_game
    until deck_empty?  
      show_definition
      input = gets.chomp 
      break if exit_game(input)    
      check_answer(input)
    end 
  end 

end
deck = DeckMaker.new
game = Game.new(deck.deck)
puts "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
game.shuffle
game.play_game 
