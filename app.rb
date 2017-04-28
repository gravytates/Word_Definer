require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*/')
also_reload('views/**/*.erb')
require('./lib/word')
require('./lib/definition')
require('pry')


get('/') do
  erb(:index)
end

get('/word/new') do
  erb(:add_word)
end

post('/word') do
  spelling = params.fetch('spelling')
  @word = Word.new({:spelling => spelling})
  @word.save()

  redirect('/')
  erb(:index)
end
