# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(
        title: 'harry potter',
        author: 'Jk Rowling',
        price: 3.00,
        published_date: Date.yesterday
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a title as a string' do
    subject.title = 89
    expect(subject).not_to be_valid
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an author as a string' do
    subject.author = true
    expect(subject).not_to be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a price as a number' do
    subject.price = '3.45'
    expect(subject).not_to be_valid
  end

  it 'is not valid without a published_date' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a published_date as a date' do
    subject.price = 'hello there'
    expect(subject).not_to be_valid
  end

  it 'is not valid with published_date being today' do
    subject.published_date = Date.current
    expect(subject).not_to be_valid
  end
end