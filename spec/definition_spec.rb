require('rspec')
require('definition')

describe(Definition) do

  before() do
    Definition.clear()
    @test_definition = Definition.new(:definition => 'not consistent or having a fixed pattern; liable to change.', :part_of_speech => 'adjective')
    @test_definition.save()
  end

  describe('#definition') do
    it('returns the definition that the definition object contains') do
      expect(@test_definition.definition()).to(eq('not consistent or having a fixed pattern; liable to change.'))
    end
  end

  describe('#part_of_speech') do
    it ('returns the part of speach that the word represents when described with the definition') do
      expect(@test_definition.part_of_speech()).to(eq('adjective'))
    end
  end

end
