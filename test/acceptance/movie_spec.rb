require_relative 'acceptance_helper'
require_relative '../../db/seed.rb'

describe('movie', :type => :feature) do

  before do
    DataMapper.auto_migrate!
    Seeder.seed!
    visit '/'
  end

  it 'shows cinemas that show this movie' do
    visit '/movie/1'
    expect(page).to have_content 'Filmbyn Sergel'
    expect(page).to have_content 'Hägerstaden'
    expect(page).to have_content 'Bioslottet'
    expect(page).to have_no_content 'None'
  end

  it 'should display none if no showings' do
    visit '/movie/4'
    expect(page).to have_content 'None'
  end

end