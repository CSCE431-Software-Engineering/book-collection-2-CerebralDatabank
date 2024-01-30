# location: spec/feature/integration_spec.rb
require 'rails_helper'
RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[author]", with: 'J.K. Rowling'
    fill_in "book[price]", with: '9.99'
    fill_in "book[pub_date]", with: '2024-01-29'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
    expect(page).to have_content('J.K. Rowling')
    expect(page).to have_content('9.99')
    expect(page).to have_content('success') # flash success message
  end
  scenario 'invalid title' do
    visit new_book_path
    fill_in "book[title]", with: ''
    fill_in "book[author]", with: 'J.K. Rowling'
    fill_in "book[price]", with: '9.99'
    fill_in "book[pub_date]", with: '2024-01-29'
    click_on 'Create Book'
    expect(page).to have_content('fail') # flash failure message
    visit books_path
    expect(page).not_to have_content('J.K. Rowling')
  end
  scenario 'invalid author' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[author]", with: ''
    fill_in "book[price]", with: '9.99'
    fill_in "book[pub_date]", with: '2024-01-29'
    click_on 'Create Book'
    expect(page).to have_content('fail')
    visit books_path
    expect(page).not_to have_content('Harry Potter')
  end
  scenario 'invalid price' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[author]", with: 'J.K. Rowling'
    fill_in "book[price]", with: '-1.00'
    fill_in "book[pub_date]", with: '2024-01-29'
    click_on 'Create Book'
    expect(page).to have_content('fail')
    visit books_path
    expect(page).not_to have_content('Harry Potter')
  end
  scenario 'invalid date' do
    visit new_book_path
    fill_in "book[title]", with: 'Harry Potter'
    fill_in "book[author]", with: 'J.K. Rowling'
    fill_in "book[price]", with: '9.99'
    fill_in "book[pub_date]", with: '3070-01-01'
    click_on 'Create Book'
    expect(page).to have_content('fail')
    visit books_path
    expect(page).not_to have_content('Harry Potter')
  end
end