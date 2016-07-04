require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :producer => "Producer",
        :fat => 1.5,
        :carbohydrate => 1.5,
        :protein => 1.5,
        :sugar => 1.5,
        :weight => 1
      ),
      Product.create!(
        :name => "Name",
        :producer => "Producer",
        :fat => 1.5,
        :carbohydrate => 1.5,
        :protein => 1.5,
        :sugar => 1.5,
        :weight => 1
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Producer".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
