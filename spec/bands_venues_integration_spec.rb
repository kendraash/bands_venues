require('spec_helper')

describe('site to add and manage a venues and bands', :type => :feature) do
  it('properly loads index page') do
    visit('/')
    expect(page).to have_content("Venues And Bands")
  end

  it('path to add a team') do
    visit('/')
    click_on('Add a new Venue')
    expect(page).to have_content('Add a Venue')
  end
end
