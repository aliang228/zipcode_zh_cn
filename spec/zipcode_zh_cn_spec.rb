require 'spec_helper'

describe ZipcodeZhCn do
  it 'has a version number' do
    expect(ZipcodeZhCn::VERSION).not_to be nil
  end

  it "上海市 复旦大学's ZipCode is 200433 " do
    expect(ZipcodeZhCn.get_zipcode("上海市 复旦大学")).to eq("200433")
  end

  it "北京大学's ZipCode is 100871 " do
    expect(ZipcodeZhCn.get_zipcode("北京大学")).to eq("100871")
  end

  it "米国大学's ZipCode is '' " do
    expect(ZipcodeZhCn.get_zipcode("米国大学")).to eq("")
  end
end
