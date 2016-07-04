require 'rails_helper'

RSpec.describe "meals/index", type: :view do
  before(:each) do
    assign(:meals, [
      Meal.create!(
        :user_id => "",
        :name => "Name",
        :description => "Description",
        :private => false
      ),
      Meal.create!(
        :user_id => "",
        :name => "Name",
        :description => "Description",
        :private => false
      )
    ])
  end

  it "renders a list of meals" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
