# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  date = Date.current
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Jk Rowling'
    fill_in 'Price', with: 3.00
    fill_in 'Published Date', with: date
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('Jk Rowling')
    expect(page).to have_content(3.00)
    expect(page).to have_content(date)
    expect(flash[:alert]).to eq('Book entered successfully.')
  end

  scenario 'invalid inputs - missing every input' do
    visit new_book_path
    click_on 'Create Book'
    visit books_path
    expect(flash[:alert]).to eq('Missing Title, Author, Price, and Published Date.')
  end

  scenario 'invalid inputs - missing title' do
    date = Date.current
    visit new_book_path
    fill_in 'Author', with: 'Jk Rowling'
    fill_in 'Price', with: 3.00
    fill_in 'Published Date', with: date
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content(3.00)
    expect(page).to have_content('Jk Rowling')
    expect(page).to have_content(date)
    expect(flash[:alert]).to eq('Missing Title.')
  end

  scenario 'invalid inputs - missing author' do
    date = Date.current
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Price', with: 3.00
    fill_in 'Published Date', with: date
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content(3.00)
    expect(page).to have_content(date)
    expect(flash[:alert]).to eq('Missing Author.')
  end

  scenario 'invalid inputs - missing price' do
    date = Date.current
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Jk Rowling'
    fill_in 'Published Date', with: date
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('Jk Rowling')
    expect(page).to have_content(date)
    expect(flash[:alert]).to eq('Missing Price.')
  end

  scenario 'invalid inputs - missing published date' do
    date = Date.current
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Jk Rowling'
    fill_in 'Price', with: 3.00
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('Jk Rowling')
    expect(page).to have_content(3.00)
    expect(flash[:alert]).to eq('Missing Published Date.')
  end
end