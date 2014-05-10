describe CoinCalculator do
  context "valid number with £ sign" do
    subject {CoinCalculator.new("£4.47")}

    its(:amount_in_sterling) {should == {"£2" => 2, "20p" => 2, "5p" => 1, "2p" => 1}}
  end
end

