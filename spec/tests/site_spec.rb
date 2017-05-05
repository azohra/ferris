require_relative '../spec_helper'

describe Ferris::Site do
  let(:responsive_site) { ResponsiveSite.new(base_url: "file://#{ENV['PWD']}/spec/support/data/responsive_site") }
  let(:compliance_site) { ComplianceSite.new(base_url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }
  let(:no_url_site) { ComplianceSite.new }

  describe 'Compliance Site' do
    it 'is the correct object type' do
      expect(compliance_site).to be_a Ferris::Site
    end

    it 'knows its base url' do
      expect(compliance_site.url).to eql "file://#{ENV['PWD']}/spec/support/data/compliance_site"
    end
  end

  describe 'Responsive Site' do
    it 'is the correct object type' do
      expect(responsive_site).to be_a Ferris::Site
    end

    it 'knows its base url' do
      expect(responsive_site.url).to eql "file://#{ENV['PWD']}/spec/support/data/responsive_site"
    end
  end

  describe 'No URL Site' do
    it 'should raise an error' do
      expect { no_url_site }.to raise_exception(Ferris::Exception::MissingBaseUrl)
    end
  end
end
