require('rspec')
require('word')

describe(Word) do

  before() do
    @test_word = Word.new(:word => 'variable')
  end
  describe('#word') do
    it('returns the word that the word object stores') do
      expect(@test_word.word()).to(eq('variable'))
    end
  end
end
