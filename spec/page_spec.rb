require 'spec_helper'

describe Ferris::Page do
  let(:site) { TestSite.new }

  it 'is the correct object type' do
    expect(site.home_page).to be_a Ferris::Page
  end

  it 'can visit' do
    expect(site.home_page.visit).to be_a Ferris::Page
  end

  it 'can retrieve its title' do
    expect(site.home_page.title).to eql 'HTML5 Test Page'
  end

  it 'can retrieve its url' do
    expect(site.home_page.url).to eql "file://#{ENV['PWD']}/spec/sites/html5_demo/index.html"
  end
end
