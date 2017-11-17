#Visits a URL, sees a signup form, enters an email and password and submits the form.

feature 'sign up' do
  scenario 'user can enter email and password, then submit' do
    visit ('/')
    fill_in 'email', with: 'rob@gmail.com'
    fill_in 'password', with: 'ThisIsMyPassword'
    click_on('submit')

    expect(page).to have_content('rob@gmail.com', 'Welcome!')
    expect(page.current_url).to include('/links')
    expect(User.all.count).to eq(1)
  end
end
