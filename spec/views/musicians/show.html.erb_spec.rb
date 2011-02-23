require 'spec_helper'

describe "musicians/show.html.erb" do
  before(:each) do
    @musician = assign(:musician, stub_model(Musician,
      :name => "Name",
      :year => 1,
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
