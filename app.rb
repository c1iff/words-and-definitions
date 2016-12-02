require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')


get('/') do
  @test_word1 = Word.new(:word => 'ruby')
  @test_word1.save()
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
