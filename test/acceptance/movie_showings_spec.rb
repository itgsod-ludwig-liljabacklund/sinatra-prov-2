require_relative 'acceptance_helper'
require_relative '../../db/seed.rb'

describe('movie showings', :type => :feature) do

  before do
    DataMapper.auto_migrate!
    Seeder.seed!
    visit '/'
  end

  it 'shows all showings for specific movie in specific cinema' do
    visit '/movie/3/cinema/1'
    expect(page).to have_content 'Mar 13, 9:15 PM'
    expect(page).to have_content 'Mar 14, 9:15 PM'
    expect(page).to have_content 'Mar 15, 9:15 PM'
    expect(page).to have_content 'Mar 16, 9:15 PM'
    expect(page).to have_content 'Mar 17, 9:15 PM'
    expect(page).to have_no_content 'Mar 18, 9:15 PM'
  end

end