feature 'link viewing' do
  scenario 'I can view links' do
    visit ('/')
    expect(page).to have_xpath("//a")
  end
end
