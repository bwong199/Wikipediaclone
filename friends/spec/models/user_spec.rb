require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many friends' do
    user1 = User.create(first_name: 'Kobe', last_name: 'Bryant')
    user2 = User.create(first_name: 'Julius', last_name: 'Randle')
    user3 = User.create(first_name: 'Jordan', last_name: 'Clarkson')

    user1.friendships.create(friend: user2)
    user1.friendships.create(friend: user3)

    expect(user1.friends).to include(user2)
    expect(user1.friends).to include(user3)
  end
end