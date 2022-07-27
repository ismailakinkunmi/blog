require 'rails_helper'

RSpec.describe 'Posts index page', type: :feature do
  before :each do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @user2 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @first_post = Post.create(author: @user, title: 'Hello', text: 'This is my post')
    5.times do |_i|
      Comment.create(post: @first_post, author: @user2, text: 'Hi Lilly!')
    end
    visit user_posts_path(@user)
  end

  scenario 'displays User profile Picture' do    
    find('img[alt="Lilly"]')
  end

  scenario 'display the User Name' do
    expect(page).to have_content(@user.name)
  end

  scenario 'displays number of posts' do
    expect(page).to have_content('Number of posts: 1')
  end

  scenario 'display the post title' do
    expect(page).to have_content(@first_post.title)
  end

  scenario 'display the post body' do
    expect(page).to have_content(@first_post.text)
  end

  scenario 'display the first comment on a post' do
    expect(page).to have_content('Hi Lilly!')
  end

  scenario 'display the how many comments' do
    expect(page).to have_content('Comments: 5')
  end

  scenario 'display the how many Likes' do
    expect(page).to have_content('Likes: 0')
  end

  scenario 'after clicking on a post, redirect on a post show page' do
    click_link("Post -#{@first_post.id}")
    expect(page).to have_content('Add a new comment')
    expect(page).to have_content(@first_post.text)
  end
end

RSpec.describe 'Test the Post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Taiwo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Algeria.')
    @user2 = User.create(name: 'Zelalem', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Student at microverse.')

    # add posts for the user
    @post = Post.create(author: @user, title: 'Post 1', text: 'This is my post')
    Comment.create(post: @post, author: @user2, text: 'Hi Lilly!')
    Comment.create(post: @post, author: @user2, text: 'Hi Lilly!')

    visit user_post_path(@post.author, @post)
  end

  scenario "I can see the post's title" do
    expect(page).to have_content(@post.title)
  end

  scenario 'I can see who wrote the post' do
    expect(page).to have_content(@user.name)
  end

  scenario 'I can see how many commentsscenario has' do
    expect(page).to have_content('Comments: 2')
  end

  scenario 'I can see how many likesscenario has' do
    expect(page).to have_content('Likes: 0')
  end

  scenario 'I can see the post body' do
    expect(page).to have_content(@post.text)
  end

  scenario 'I can see the username of each commentor' do
    expect(page).to have_content(@user2.name)
  end

  scenario 'I can see the comment each commentor left' do
    expect(page).to have_content('Hi Lilly!')
  end
end
