describe CoinCalculator do
  subject {CoinCalculator.new("£4.47")}

  its(:numeric_value) {should == 4.47}
end
