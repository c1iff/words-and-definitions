require('rspec')
require('word')
require('definition')

describe(Word) do

  before() do
    Word.clear()
    @test_word = Word.new(:word => 'variable')
    @test_word.save()
  end

  describe('#word') do
    it('returns the word that the word object contains') do
      expect(@test_word.word()).to(eq('variable'))
    end
  end

  describe('.all') do
    it('returns the @@words class variable containing all saved words') do
      expect(Word.all()).to(eq([@test_word]))
    end
  end

  describe('#id') do
    it('returns a unique id number for every word that is saved to the @@words class variable') do
      expect(@test_word.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns a word object based on an id number') do
      test_word2 = Word.new(:word => 'array')
      test_word2.save()
      expect(Word.find(test_word2.id)).to(eq(test_word2))
    end
  end

  describe('#add_definition') do
    it('adds a definition object to a word') do
      test_definition = Definition.new(:definition => 'not consistent or having a fixed pattern; liable to change.', :part_of_speech => 'adjective')
      @test_word.add_definition(test_definition)
      expect(@test_word.definitions()).to(eq([test_definition]))
    end
  end

  describe('#add_definition') do
    it('adds multiple definition objects to a word') do
      test_definition = Definition.new(:definition => 'not consistent or having a fixed pattern; liable to change.', :part_of_speech => 'adjective')
      @test_word.add_definition(test_definition)
      test_definition2 = Definition.new(:definition => 'able to be changed or adapted.', :part_of_speech => 'adjective')
      @test_word.add_definition(test_definition2)
      expect(@test_word.definitions()).to(eq([test_definition, test_definition2]))
    end
  end

  describe('#find_definition') do
    it('returns a definition from a word based on an id number') do
      test_definition = Definition.new(:definition => 'not consistent or having a fixed pattern; liable to change.', :part_of_speech => 'adjective')
      @test_word.add_definition(test_definition)
      expect(@test_word.find_definition(test_definition.id)).to(eq(test_definition))
    end
  end
end
