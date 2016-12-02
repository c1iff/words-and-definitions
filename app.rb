require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')


get('/') do
  @test_word1 = Word.new(:word => 'ruby')
  @test_word1.save()

  test_definition = Definition.new(:definition => 'not consistent or having a fixed pattern; liable to change.', :part_of_speech => 'adjective')
  @test_word1.add_definition(test_definition)

  @test_word2 = Word.new(:word => 'object')
  @test_word2.save()
  @test_word3 = Word.new(:word => 'method')
  @test_word3.save()
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  @current_word = Word.find(params.fetch('id').to_i)
  @definitions = @current_word.definitions()
  erb(:word)
end

get('/definition/new/:id') do
  @current_word = Word.find(params.fetch('id').to_i)
  erb(:new_definition)
end

post('/add_definition/:id') do
  @current_word = Word.find(params.fetch('id').to_i)
  @new_definition = params.fetch('definition')
  # @current_part_speech = params.fetch('part-speech')
  @current_definition = Definition.new(:definition => @new_definition, :part_of_speech => 'test')
  @current_word.add_definition(@current_definition)
  erb(:success)
end
