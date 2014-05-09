require 'rubygems'  
require 'sinatra' 
require 'active_record'
require 'haml'
 
ActiveRecord::Base.establish_connection(
   :adapter => 'sqlite3',
   :database =>  'db/test.sqlite3.db'
)

#Models
class Post < ActiveRecord::Base
end




#Display list of nice things
get '/' do  

  @posts = Post.all
  haml :list   
end  


#Submit a nice thing
get '/new' do  
  haml :form  
end  

#Handle submissions
post '/new' do
 @post = Post.new(params[:post])
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    "Error saving..."
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  haml :post
end

not_found do  
  status 404  
  'not found'  
end  