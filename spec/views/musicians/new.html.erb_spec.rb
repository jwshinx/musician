require 'spec_helper'

describe "musicians/new.html.erb" do
  before(:each) do
    assign(:musician, stub_model(Musician,
      :name => "MyString",
      :year => 1,
      :category => nil
    ).as_new_record)
  end

  it "renders new musician form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => musicians_path, :method => "post" do
      assert_select "input#musician_name", :name => "musician[name]"
      assert_select "input#musician_year", :name => "musician[year]"
      assert_select "input#musician_category", :name => "musician[category]"
    end
  end
end
