require_relative '../spec_helper'

describe Ferris::Region do
  let(:compliance_site) { ComplianceSite.new(base_url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }

  it 'is the correct object type' do
    expect(compliance_site.elements_header).to be_a Ferris::Region
  end

  it 'can call exists?' do
    expect(compliance_site.elements_header).to respond_to(:exists?)
  end

  it 'can call present?' do
    expect(compliance_site.elements_header).to respond_to(:present?)
  end

  it 'cannot call click' do
    expect(compliance_site.elements_header).not_to respond_to(:click)
  end
end
