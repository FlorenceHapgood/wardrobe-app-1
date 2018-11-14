require 'rails_helper.rb'

RSpec.feature 'uploading photos', type: :feature do

  scenario 'A user can upload an image and see it on the items page' do
    visit('/')
    click_link('Sign up')
    fill_in('user_email', with: "testemail@gmail.com")
    fill_in('user_password', with: "password1234")
    fill_in('user_password_confirmation', with: "password1234")
    click_button('Sign up')
    visit ("/items")
    click_link ("New Item")
    attach_file('item[image]', File.join(Rails.root + 'spec/fixtures/clueless.jpg'))
    select "blue", from: 'item[colour]'
    click_button "Create Item"
    expect(page).to have_content('Item was successfully created')
    expect(page).to have_css("img[src*='clueless.jpg']")
    click_link ("Back")
    expect(page).to have_css("img[src*='clueless.jpg']")
  end
end
