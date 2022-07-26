require 'rails_helper'

# Test the users index page using integration tests

RSpec.describe 'Users index page', type: :feature do
  before :each do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @user2 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')    
  end
  scenario 'displays all users username' do
    visit '/'
    (sleep 5)
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user2.name)    
  end

  scenario 'displays all users profile photo' do
    visit '/'
    (sleep 5)
    find('img[alt="Lilly"]')
    find('img[alt="Tom"]')    
  end

  scenario 'displays number of posts' do
    visit '/'
    (sleep 5)
    expect(page).to have_content('Number of posts: 0')
  end

  scenario 'after clicking on a user, the user profile page is displayed' do
    visit '/'
    click_link @user.name
    (sleep 5)
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
  end
end