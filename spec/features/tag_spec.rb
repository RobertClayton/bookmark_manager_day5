feature 'add tags' do
  scenario 'the user can tag links in the BookmarkManager' do
    visit ('/links')
    visit ('/links/new')
    fill_in 'url', with: 'google.co.uk'
    fill_in 'title', with: 'Google'
    fill_in 'tag', with: 'Search'
    click_on('Submit')

    visit ('/links/new')
    fill_in 'url', with: 'facebook.co.uk'
    fill_in 'title', with: 'FB'
    fill_in 'tag', with: 'Social'
    click_on('Submit')


    expect(Link.all.tags.map(&:name)).to include('Search')
  end
end
