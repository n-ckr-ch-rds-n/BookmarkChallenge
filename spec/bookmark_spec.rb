require 'bookmark'
require 'pg'

describe Bookmark do
  describe '#all' do
    it 'returns all the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark_1 = Bookmark.create(url: "http://makersacademy.com", title: "makers")
      bookmark_2 = Bookmark.create(url: "http://destroyallsoftware.com", title: "destroy all software")
      bookmark_3 = Bookmark.create(url: "http://google.com", title: "Google")

      expected_bookmarks = [
        bookmark_1,
        bookmark_2,
        bookmark_3
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '#==' do
    it 'two Bookmarks are equal if their IDs match' do
      bookmark_1 = Bookmark.new(1, 'http://testbookmark.com', 'test_bookmark')
      bookmark_2 = Bookmark.new(1, 'http://testbookmark.com', 'test_bookmark')

      expect(bookmark_1).to eq bookmark_2
    end
  end

  describe '.create' do
    it 'creates a bookmark' do
      bookmark = Bookmark.create(url: 'http://testbookmark.com', title: "test_bookmark")
      expect(Bookmark.all).to include bookmark
    end
  end
end
