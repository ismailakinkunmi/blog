require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validaiton tests for user' do
    subject { User.new(name: 'ismail', photo: 'profile.png', bio: 'ismail the great', post_counter: 0) }
    before { subject.save }

    it 'Shuold have name present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Should have post counter as an integer' do
      subject.post_counter = 3
      expect(subject).to be_valid
    end

    it 'Should have post counter not as float' do
      subject.post_counter = 3.5
      expect(subject).to_not be_valid
    end

    it 'Should have post counter not be less than zero' do
      subject.post_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Should have the subject as valid' do
      expect(subject).to be_valid
    end
  end

  describe 'Test for recent comments on posts' do
    subject do
      ismail = User.new(name: 'ismail', photo: 'profile.png',
                        bio: 'I am coming out to be the best computer programmer', posts_counter: 0)
      Post.new(title: 'My best friend', text: 'He will be unvailed at the end of my program at Microverse',
               comment_counter: 3, like_counter: 3, author_id: ismail.id)
    end
  end
end
