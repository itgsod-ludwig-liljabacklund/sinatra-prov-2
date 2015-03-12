require_relative 'acceptance_helper'
require_relative '../../db/seed.rb'

describe('booking', :type => :feature) do

  before do
    DataMapper.auto_migrate!
    Seeder.seed!
    visit '/'
  end

  it 'shows cinemas that show this movie' do
    visit '/book_showing/1'
    expect(page).to have_content 'The Duplo Movie'
    expect(page).to have_content 'Filmbyn Sergel, Room 1.'
    expect(page).to have_content 'Mar 13, 9:15 PM'
    expect(page).to have_content '240'
  end

  it 'should book properly' do
    visit '/book_showing/1'
    fill_in('Name', :with => 'John')
    click_button('Book')
    visit '/book_showing/1'
    expect(page).to have_content '239'
    expect(Booking.first(name: 'John', showing_id: '1')).not_to be_nil
  end

end