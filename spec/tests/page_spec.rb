require_relative '../spec_helper'

describe Ferris::Page do
  let(:compliance_site) { ComplianceSite.new(base_url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }

  it 'is the correct object type' do
    expect(compliance_site.elements_page).to be_a Ferris::Page
  end

  it 'can visit' do
    expect(compliance_site.elements_page.visit).to be_a Ferris::Page
  end

  it 'can retrieve its title' do
    expect(compliance_site.elements_page.title).to eql 'HTML5 Test Page'
  end

  it 'can retrieve its url' do
    expect(compliance_site.elements_page.url).to eql "file://#{ENV['PWD']}/spec/support/data/compliance_site/index.html"
  end
end
