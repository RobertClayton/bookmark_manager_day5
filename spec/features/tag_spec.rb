feature 'add tags' do
  scenario 'user can tags to links when making a Bookmark' do
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
    expect(Link.all.tags.map(&:name)).to include('Search','Social')
  end

  scenario 'user can add multiple tags to a link when making a Bookmark' do
    visit ('/links/new')
    fill_in 'url', with: 'youtube.co.uk'
    fill_in 'title', with: 'Youtube'
    fill_in 'tag', with: 'Search Video'
    click_on('Submit')
    expect(Link.all.tags.map(&:name)).to include('Search','Video')
  end

  scenario 'user can filter tag links' do
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

    visit ('/links')
    fill_in 'filter', with: 'Search'
    click_on('Filter')
    expect(page).to have_content('google.co.uk')
    expect(page).to have_no_content('facebook.co.uk')
  end
end
