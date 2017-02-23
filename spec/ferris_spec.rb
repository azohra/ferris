require 'spec_helper'

describe 'Wikipedia' do
  it 'can search' do
    home_page.visit
    header.search('Apple')
    expect(Ferris::Config.browser.title).to eql 'Apple - Wikipedia'
  end

  it 'can check a region is present' do
    home_page.visit
    expect(header.present?).to be_truthy
  end

  it 'can check a page is loaded' do
    home_page.visit
    header.search('Apple')
    expect(apple_page.loaded?).to be_truthy
  end

  it 'can check an elements keyword' do
    expect(apple_page.article_heading.keyword).to eq(:article_heading)
  end

  it 'can throw a .loaded? exception' do
    expect { home_page.loaded? }.to raise_error(Ferris::RequirementsException)
  end

  it 'can throw a .present? exception' do
    expect { home_page.present? }.to raise_error(Ferris::RootMissingException)
  end
end
