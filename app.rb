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

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks/new' do
    redirect '/error' unless Bookmark.is_valid?(params['url'])
    Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  get '/bookmarks/update' do
    @bookmarks = Bookmark.all
    erb(:"bookmarks/update")
  end

  post '/bookmarks/update' do
    session[:titletoupdate] = params['title']
    p session[:titletoupdate]
    redirect '/bookmarks/newurl'
  end

  get "/bookmarks/newurl" do
    erb(:"bookmarks/newurl")
  end

  post "/bookmarks/newurl" do
    p params['newurl']
    p session[:titletoupdate]
    Bookmark.update(params['newurl'], session[:titletoupdate])
    redirect '/bookmarks'
  end

  get '/bookmarks/delete' do
    @bookmarks = Bookmark.all
    erb(:"bookmarks/delete")
  end

  post "/bookmarks/delete" do
    Bookmark.delete(params['title'])
    redirect '/bookmarks'
  end

  get '/error' do
    erb(:error)
  end

  run! if app_file == $0

end
