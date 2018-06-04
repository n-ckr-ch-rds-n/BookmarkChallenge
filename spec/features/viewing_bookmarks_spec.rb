require 'pg'

feature 'viewing bookmarks' do
  scenario 'A user can view bookmark links' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    visit ('/bookmarks')
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://makersacademy.com');")
    expect(page).to have_content "http://makersacademy.com"
  end
end
