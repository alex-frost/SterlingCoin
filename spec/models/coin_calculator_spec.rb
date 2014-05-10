describe CoinCalculator do
  context "valid number with £ sign" do
    subject {CoinCalculator.new("£4.47")}

    its(:remove_pounds_and_pence_signs) {should == "4.47"}
    its(:split_into_pounds_and_pence) {should == ["4","47"]}
  end
end
