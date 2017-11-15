feature 'add tags' do
  scenario 'the user can tag links in the BookmarkManager' do
    visit ('/links')
    visit ('/links/new')

    fill_in 'url', with: 'google.co.uk'
    fill_in 'title', with: 'Google'
    fill_in 'tag', with: 'Search'
    click_on('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Search')
  end
end
