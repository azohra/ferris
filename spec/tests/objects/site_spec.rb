require_relative '../../spec_helper'

describe Ferris::Site do
  let(:compliance_site) { ComplianceSite.new(url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }

  describe 'Compliance Site' do
    it 'is the correct object type' do
      expect(compliance_site).to be_a Ferris::Site
    end

    it 'responds to url' do
      expect(compliance_site).to respond_to :url
    end

    it 'can retrieve its url' do
      expect(compliance_site.url).to eql "file://#{ENV['PWD']}/spec/support/data/compliance_site"
    end
  end

end
