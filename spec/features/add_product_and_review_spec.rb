require 'rails_helper'

describe "product and review for that product" do
  it "adds a new product" do
    visit root_path
    click_link 'New Product'
    fill_in 'Name', :with => 'buffalo leg'
    click_on 'Create Product'
    expect(page).to have_content 'be blank'
    fill_in 'Country', :with => 'USA'
    fill_in 'Cost', :with => 3
    click_on 'Create Product'
    expect(page).to have_content 'buffalo leg'
  end
  it 'adds a review to a product' do
    product = FactoryGirl.create(:product)
    visit product_path(product)
    fill_in 'Author', :with => 'BOB'
    fill_in 'Content body', :with => 'file:///C:/Users/Ben/Desktop/marios-organic-nongmo-gluten-free-market/tmp/capybara/capybara-201707072148454182307707.html'
    fill_in 'Rating', :with => 3
    click_on 'Create Review'
    expect(page).to have_content 'BOB'
    expect(page).to have_content 3
  end
end