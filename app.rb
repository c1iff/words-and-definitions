require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')


get('/') do
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  @current_word = Word.find(params.fetch('id').to_i)
  @definitions = @current_word.definitions()
  erb(:word)
end

get('/new/word') do
  erb(:new_word)
end

post('/add/word') do
  @new_word = params.fetch('word')
  Word.new(:word => @new_word).save()
  erb(:success)
end

get('/sort/words') do
  Word.sort_words_a_to_z()
  @words = Word.all()
  erb(:index)
end

get('/definition/new/:id') do
  @current_word = Word.find(params.fetch('id').to_i)
  erb(:new_definition)
end

post('/add_definition/:id') do
  @current_word = Word.find(params.fetch('id').to_i)
  @new_definition = params.fetch('definition')
  @current_part_speech = params.fetch('part-speech')
  @current_definition = Definition.new(:definition => @new_definition, :part_of_speech => @current_part_speech)
  @current_word.add_definition(@current_definition)
  erb(:success)
end
