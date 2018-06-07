require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'pg'

class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks' do
    redirect '/error' unless Bookmark.is_valid?(params['url'])
    Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  post "/bookmarks/delete" do
    Bookmark.delete(params['title'])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  get '/error' do
    #flash[:notice] = "Invalid URL"
    erb(:error)
  end

  get '/bookmarks/delete' do
    @bookmarks = Bookmark.all
    erb(:"bookmarks/delete")
  end

  run! if app_file == $0

end
