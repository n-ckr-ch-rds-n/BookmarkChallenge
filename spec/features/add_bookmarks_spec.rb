feature 'user can add bookmarks' do
  scenario 'user can add a website to their bookmarks' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://www.bbc.co.uk/')
    click_button('Submit')
    expect(page).to have_link(href: 'http://www.bbc.co.uk/')

  end

  scenario 'user tries to add an invalid URL' do
    visit '/bookmarks/new'
    fill_in('url', with: 'some rubbish')
    click_button('Submit')
    expect(page).not_to have_content 'http://www.bbc.co.uk/'
    expect(page).to have_content 'Invalid URL'
  end
end
