require 'bike'

describe Bike do
  bike = described_class.new
  describe "#working?" do
    it "checks bike is working" do
      expect(bike).to respond_to(:working?)
    end
  end

end
