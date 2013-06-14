class DeckMaker
  attr_reader :deck

  def initialize
    @deck = []
    parse_file
  end

  def parse_file(file = 'flashcard_samples.txt')
    f = File.read(file).split(/\n/).reject { |elem| elem == " " }
      
    f.each_slice(2) do |definition, term|
      make_card({definition: definition, term: term})
    end 
  end

  def make_card(card_attrs)
    @deck << Card.new(card_attrs)
  end
end


class Card
  attr_reader :term, :definition

  def initialize(hash)
    @term = hash[:term]
    @definition = hash[:definition]
  end
end


