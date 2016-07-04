require 'rails_helper'

RSpec.describe "meals/edit", type: :view do
  before(:each) do
    @meal = assign(:meal, Meal.create!(
      :user_id => "",
      :name => "MyString",
      :description => "MyString",
      :private => false
    ))
  end

  it "renders the edit meal form" do
    render

    assert_select "form[action=?][method=?]", meal_path(@meal), "post" do

      assert_select "input#meal_user_id[name=?]", "meal[user_id]"

      assert_select "input#meal_name[name=?]", "meal[name]"

      assert_select "input#meal_description[name=?]", "meal[description]"

      assert_select "input#meal_private[name=?]", "meal[private]"
    end
  end
end
