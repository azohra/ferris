require 'spec_helper'
require 'benchmark'

describe Ferris::Core do
  let(:site) { TestSite.new }
  let(:data) { FormData.new }
  let(:expected_result) { data.to_hash }
  let(:found_result) { Hash[expected_result.map { |k, _v| [k, site.home_page.send(k).value] }] }

  it 'can call do' do
    site.home_page.visit
    site.home_page.do(data)
    expect(found_result).to include expected_result
  end

  it 'can call do!' do
    site.home_page.visit
    site.home_page.do!(data)
    expect(found_result).to include expected_result
  end

  it 'hopes do! is better than do' do
    watir = Benchmark.measure { site.home_page.visit.do(data) }
    ferris = Benchmark.measure { site.home_page.visit.do!(data) }
    # puts "Result: #{ferris.real} vs #{watir.real}"
    expect(ferris.real).to be < watir.real
  end
end
