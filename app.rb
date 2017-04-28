require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*/')
also_reload('views/**/*.erb')
require('./lib/word')
require('./lib/definition')


get('/') do
  @words = Word.all

  erb(:index)
end

get('/word/new') do
  erb(:add_word)
end

get('/all_words') do
  @words = Word.all
  erb(:all_words_definitions)
end

get('/random') do
  @word = Word.shuffle[0]
  erb(:word_details)
end

post('/word') do
  spelling = params.fetch('spelling')
  picture = params.fetch('picture')
  @word = Word.new({:spelling => spelling, :picture => picture})
  @word.save()
  redirect('/')
  erb(:index)
end


get('/:id/definition/new') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:add_definition)
end

post('/:id') do
  meaning = params.fetch('meaning')
  @definition = Definition.new({:meaning => meaning})
  @definition.save()
  @word = Word.find(params.fetch('id').to_i)
  @word.add_definition(@definition)
  redirect('/')
  erb(:index)
end

get('/:id') do
  @word = Word.find(params.fetch('id').to_i)
  erb(:word_details)
end

get('/sort') do
  @just_words = Word.sort
  erb(:sort_index)
end
