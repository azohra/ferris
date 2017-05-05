require_relative '../spec_helper'

describe 'Ferris Element' do
  let(:compliance_site) { ComplianceSite.new(base_url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }

  it 'can call keyword' do
    expect(compliance_site.elements_page.text_field.keyword).to eq(:text_field)
  end

  it 'can call do' do
    compliance_site.elements_page.visit
    compliance_site.elements_page.text_field.do 'Apple'
    expect(compliance_site.elements_page.text_field.value).to eql 'Apple'
  end

  it 'can call do!' do
    compliance_site.elements_page.visit
    compliance_site.elements_page.text_field.do! 'Apple'
    expect(compliance_site.elements_page.text_field.value).to eql 'Apple'
  end

  it 'can locate from a region' do
    expect(compliance_site.elements_header.title).to be_a Watir::Element
  end

  it 'can locate from a page' do
    expect(compliance_site.elements_page.text_field).to be_a Watir::Element
  end
end
