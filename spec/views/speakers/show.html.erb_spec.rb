require 'rails_helper'

RSpec.describe "speakers/show", type: :view do
  before(:each) do
    @speaker = assign(:speaker, FactoryGirl.create(:speaker, 
      :first_name => "Bob",
      :last_name => "Jones",
      :website => "http://www.bobjones.edu",
      :company => "Bob Jones University"
    ))

    @speaker.talks = FactoryGirl.create_list(:talk, 2)
  end

  it "has an ID that identifies the speaker" do 
    render
    expect(rendered).to have_selector "#speaker_#{@speaker.id}_profile"
  end

  it "renders attributes" do
    render
    expect(rendered).to match(/Bob Jones/)
    expect(rendered).to match(/http\:\/\/www\.bobjones\.edu/)
    expect(rendered).to match(/Bob Jones University/)
  end

  it "display's the speaker's talks" do 
    render
    expect(rendered).to have_content(@speaker.talks.first.title)
    expect(rendered).to have_content(@speaker.talks.last.title)
  end
end
