require 'sinatra/base'
require './lib/bookmark'
require 'pg'

class BookmarkApp < Sinatra::Base

  get '/bookmarks/new' do
    erb(:"bookmarks/new")
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:index)
  end

  run! if app_file == $0

end
