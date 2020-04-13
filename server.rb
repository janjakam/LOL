require 'sinatra'
#require 'shotgun'

set :protection, :except => :frame_options
set :bind, '0.0.0.0'
set :port, 8080

get '/' do 
  '<h2>Hallo Jan!</h2> <p>wow, das klappt</p>'  
end

get '/mysecretpage' do 
  '<h2>Top Secret</h2> <p>Schweine können in wirklichkeit fliegen</>'  
end

get '/mysecretsecretpage' do 
  '<h2>Top Top Secret</h2> <p>Es gibt Aliens</>' 
end

get "/erb-template-external" do
    erb :mytemplate, :layout => :mylayout
end
