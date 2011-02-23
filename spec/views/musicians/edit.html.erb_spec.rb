require 'spec_helper'

describe "musicians/edit.html.erb" do
  before(:each) do
    @musician = assign(:musician, stub_model(Musician,
      :name => "MyString",
      :year => 1,
      :category => nil
    ))
  end

  it "renders the edit musician form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => musicians_path(@musician), :method => "post" do
      assert_select "input#musician_name", :name => "musician[name]"
      assert_select "input#musician_year", :name => "musician[year]"
      assert_select "input#musician_category", :name => "musician[category]"
    end
  end
end
