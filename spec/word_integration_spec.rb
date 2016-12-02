require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('Verifies the home page is functioning') do
    visit('/')
    expect(page).to have_content('Select a word below to view/add definitions')
  end
end

describe('the add word path', {:type => :feature}) do
  it('Adds a new word, verifies it is listed') do
    Word.clear()
    visit('/')
    click_link('Add a Word')
    fill_in('word', :with => 'Variable')
    click_button('Add Word')
    click_link('Return')
    expect(page).to have_content('variable')
  end
end

describe('the add definition path', {:type => :feature}) do
  it('Adds a new definition to a word, verifies it is listed') do
    visit('/')
    click_link('variable')
    click_link('Add a Definition')
    fill_in('definition', :with => 'not consistent or having a fixed pattern; liable to change.')
    click_button('Add Definition')
    click_link('Return')
    click_link('variable')
    expect(page).to have_content('not consistent or having a fixed pattern; liable to change. (Noun)')
  end
end
