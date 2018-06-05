require 'bookmark'
require 'pg'

describe Bookmark do
  describe '#all' do
    it 'returns all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://makersacademy.com')")
      expect(Bookmark.all).to include "http://makersacademy.com"
    end
  end

  describe '.create' do
    it 'creates a bookmark' do

      Bookmark.create(url: 'http://www.bbc.co.uk')
      expect(Bookmark.all).to include 'http://www.bbc.co.uk'
    end
  end
end
