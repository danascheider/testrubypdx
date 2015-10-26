require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:last_name) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password_digest) }
  it { is_expected.to respond_to(:name) }

  let(:valid_attributes) do 
    {
      name: 'foobarbaz3',
      password: 'foobarbaz',
      email: 'foobar@baz.com'
    }
  end

  let(:user) { FactoryGirl.create(:user) }

  it 'is invalid without a name' do 
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without a password' do 
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without an e-mail' do 
    user.email = nil
    expect(user).not_to be_valid
  end
end
