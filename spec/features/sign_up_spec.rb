feature 'sign up' do
  scenario 'user can enter email and password, then submit' do
    visit ('/')
    fill_in 'email', with: 'rob@gmail.com'
    fill_in 'password', with: 'ThisIsMyPassword'
    fill_in 'password_confirmation', with: 'ThisIsMyPassword'
    click_on('submit')

    expect(page).to have_content('rob@gmail.com', 'Welcome!')
    expect(page.current_url).to include('/links')
    expect(User.all.count).to eq(1)
  end

  scenario 'user cannot sign up when inputting mismatching passwords' do
    visit '/'
    fill_in 'email', with: 'rob@gmail.com'
    fill_in 'password', with: 'ThisIsMyPassword'
    fill_in "password_confirmation", with: 'NotMyPassword'
    click_on('submit')
    expect(User.all.count).to eq(0)
    expect(User.all).to be_empty
    expect(page.current_url).to include('/user')
    expect(page).to have_content('Password and confirmation password do not match')
  end

end
