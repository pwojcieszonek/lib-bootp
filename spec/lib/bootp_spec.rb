require_relative '../spec_helper'
RSpec.describe Lib::BOOTP do
  it "has a version number" do
    expect(Lib::BOOTP::VERSION).not_to be nil
  end
end
