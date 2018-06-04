require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns all the bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://google.com"
    end
  end
end
