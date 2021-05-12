# feature 'a user can sign out' do
#     scenario 'a signed in user can sign out' do
#         visit '/'
#         click_link('Sign Up')
#         fill_in('name', with: 'Joanna')
#         fill_in('username', with: 'jojobrigs')
#         fill_in('email', with: 'test@test.com')
#         fill_in('password', with: 'password123')
#         click_button('Submit')
#         click_link('Sign In')
#         fill_in('username', with: 'jojobrigs')
#         fill_in('password', with: 'password123')
#         click_button('Get Peeping')
#         click_on('Sign Out')

#         expect(page).to have_link('Sign In')
#         expect(page).to have_link('Sign Up')
#         #expect page not to have form to add a peep
#     end
# end

