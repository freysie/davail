require 'spec_helper'

# TODO: Hurr, hurr, hurr…
describe Davail do
  it "has a version number" do
    expect(Davail::VERSION).not_to be nil
  end

  it "has a version string" do
    expect(Davail::VERSION_STRING).not_to be nil
  end

  it "has a usage description" do
    expect(Davail::USAGE).not_to be nil
  end
end
