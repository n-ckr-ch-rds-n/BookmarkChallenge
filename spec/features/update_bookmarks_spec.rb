feature "user can update bookmarks" do
  scenario "user can update a bookmark by choosing a bookmark and giving it a new URL" do
    visit "/bookmarks/new"
    fill_in("url", with: "http://www.bbq.co.uk/")
    fill_in("title", with: "BBC")
    click_button "Submit"
    visit "/bookmarks/update"
    choose "BBC"
    click_button "Update"
    fill_in("newurl", with: "http://www.bbc.co.uk/")
    click_button "Submit"
    expect(page).to have_link(href: 'http://www.bbc.co.uk/')
  end
end
