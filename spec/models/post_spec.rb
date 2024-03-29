# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   describe 'Validaiton for post' do
#     subject do
#       ismail = User.new(name: 'ismail', photo: 'profile.png',
#                         bio: 'I am coming out to be the best computer programmer', post_counter: 0)
#       Post.new(title: 'My best friend', text: 'He will be unvailed at the end of my program at Microverse',
#                comment_counter: 3, like_counter: 3, author_id: ismail.id)
#     end

#     before { subject.save }

#     it 'Should have title present' do
#       subject.title = nil
#       expect(subject).to_not be_valid
#     end

#     it 'Should have title not being too long' do
#       subject.title = 'one' * 200
#       expect(subject).to_not be_valid
#     end

#     it 'Should have comments counter as an integer' do
#       subject.comment_counter = 0.033
#       expect(subject).to_not be_valid
#     end

#     it 'Should have comments counter not be less than zero' do
#       subject.comment_counter = -1
#       expect(subject).to_not be_valid
#     end

#     it 'Should have likes counter not be less than zero' do
#       subject.like_counter = -1
#       expect(subject).to_not be_valid
#     end
#   end
# end
