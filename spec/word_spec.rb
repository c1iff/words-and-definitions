require('rspec')
require('word')

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


end
