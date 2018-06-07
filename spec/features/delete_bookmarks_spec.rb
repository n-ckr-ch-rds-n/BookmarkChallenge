feature "user can delete bookmarks" do
  scenario "user can delete a bookmark by choosing the corresponding radio button" do
    visit "/bookmarks/new"
    fill_in("url", with: "http://www.bbc.co.uk/")
    fill_in("title", with: "BBC")
    click_button "Submit"
    visit "/bookmarks/delete"
    choose "BBC"
    click_button "Delete"
    expect(page).to_not have_content "BBC"
  end
end