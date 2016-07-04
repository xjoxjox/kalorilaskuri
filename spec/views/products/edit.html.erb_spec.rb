require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :producer => "MyString",
      :fat => 1.5,
      :carbohydrate => 1.5,
      :protein => 1.5,
      :sugar => 1.5,
      :weight => 1
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "input#product_producer[name=?]", "product[producer]"

      assert_select "input#product_fat[name=?]", "product[fat]"

      assert_select "input#product_carbohydrate[name=?]", "product[carbohydrate]"

      assert_select "input#product_protein[name=?]", "product[protein]"

      assert_select "input#product_sugar[name=?]", "product[sugar]"

      assert_select "input#product_weight[name=?]", "product[weight]"
    end
  end
end