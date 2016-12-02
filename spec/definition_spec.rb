require('rspec')
require('definition')

describe(Definition) do

  before() do
    Definition.clear()
    @test_definition = Definition.new(:definition => 'not consistent or having a fixed pattern; liable to change.')
    @test_definition.save()
  end

  describe('#definition') do
    it('returns the definition that the definition object contains') do
      expect(@test_definition.definition()).to(eq('not consistent or having a fixed pattern; liable to change.'))
    end
  end

end
