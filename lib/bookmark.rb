require 'pg'
require 'uri'
class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_test')
    end

    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(options)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager_test')
    end
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{options[:url]}')")
  end

  def self.is_valid?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end


end
