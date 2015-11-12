require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user1 = User.create(first_name: 'Kobe', last_name: 'Bryant')
    @user2 = User.create(first_name: 'Julius', last_name: 'Randle')

    @friendship = @user1.friendships.create(friend: @user2)
  end
  it 'belongs to a user' do
    expect(@friendship.user).to eq(@user1)
  end

  it 'belongs to a friend' do
    expect(@friendship.friend).to eq(@user2)
  end
end