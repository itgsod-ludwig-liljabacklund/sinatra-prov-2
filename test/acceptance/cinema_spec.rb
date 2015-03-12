require_relative 'acceptance_helper'
require_relative '../../db/seed.rb'

describe('cinema', :type => :feature) do

  before do
    DataMapper.auto_migrate!
    Seeder.seed!
    visit '/'
  end

  it 'shows movies that the cinema is showing' do
    visit '/cinema/1'
    expect(page).to have_content 'The Duplo Movie'
    expect(page).to have_content 'Intrastellar'
    expect(page).to have_content 'Fight Association'
  end

end