require 'spec_helper'

describe Ferris::Site do
  let(:site) { TestSite.new }

  it 'type' do
    expect(site).to be_a Ferris::Site
  end
end
