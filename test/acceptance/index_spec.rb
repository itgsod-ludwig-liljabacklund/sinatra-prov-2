require_relative 'acceptance_helper'
require_relative '../../db/seed.rb'

describe('index', :type => :feature) do

  before do
    DataMapper.auto_migrate!
    Seeder.seed!
    visit '/'
  end

  it 'shows all movies' do
    expect(page).to have_content 'The Duplo Movie'
    expect(page).to have_content 'Intrastellar'
    expect(page).to have_content 'Fight Association'
    expect(page).to have_content 'Trans-formers'
  end

  it 'shows all cinemas' do
    expect(page).to have_content 'Filmbyn Sergel'
    expect(page).to have_content 'Hägerstaden'
    expect(page).to have_content 'Bioslottet'
  end

end