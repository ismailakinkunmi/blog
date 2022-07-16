require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'Validaiton tests for user' do
    subject { User.new(name: 'ismail', photo: 'profile.png', bio: 'learning rails ', posts: 0) }
    before { subject.save }

    it 'Shuold have name present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Should have post as an integer' do
      subject.posts = 3
      expect(subject).to be_valid
    end

    it 'Should have post counter not be less than zero' do
      subject.posts = -1
      expect(subject).to_not be_valid
    end

    it 'Should have the subject as valid' do
      expect(subject).to be_valid
    end
  end

  describe 'Test for recent comments on posts' do
    subject do
      ismail = User.new(name: 'ismail', photo: 'profile.png',
                       bio: 'programmer', posts: 0)
      Post.new(title: 'My best friend', text: 'He will be unvailed at the end of my program at Microverse',
               comment_counter: 3, like_counter: 3, author_id: ismail.id)
    end
    it 'Should have maximum of five comments' do
      expect(subject.recent_comments).to eq(subject.recent_comments)
    end
  end
end