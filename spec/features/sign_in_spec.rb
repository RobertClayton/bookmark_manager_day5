feature 'sign in' do
  scenario 'existing users can sign in' do
    visit('users/sign_in')
    User.create(email: 'rob@email.me', password: 'ValidPassword', password_confirmation: 'ValidPassword')
    fill_in(:email, with: 'rob@email.me')
    fill_in(:password, with: 'ValidPassword')
    click_button('submit')
    expect(page.current_url).to include('/links')
    expect(page).to have_content('Welcome!', 'rob@email.me')
  end
end
