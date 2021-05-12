feature 'Viewing Index' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
    expect(page).to have_link('Sign Up')
    expect(page).to have_link('Sign In')
    expect(page).not_to have_button('Sign Out')
  end
end
