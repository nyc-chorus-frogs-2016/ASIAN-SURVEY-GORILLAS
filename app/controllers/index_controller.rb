get '/' do
  @surveys = Survey.all
  erb :'surveys/index'

end
