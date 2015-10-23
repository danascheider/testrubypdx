require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let(:users) { FactoryGirl.create_list(:user, 2) }

  xit "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
