describe MoneySign do
  context "pence no decimal point" do
    subject {MoneySign.new("197p")}

    its(:has_pound_sign?) {should == false}
    its(:has_decimal_point?) {should == false}
    its(:has_pence_sign?) {should == true}
  end

  context "pounds decimal" do
    subject {MoneySign.new("1.87")}

    its(:has_pound_sign?) {should == false}
    its(:has_decimal_point?) {should == true}
    its(:has_pence_sign?) {should == false}
  end

  context "pound symbol" do
    subject {MoneySign.new("£1.23")}
    its(:has_pound_sign?) {should == true}
    its(:has_decimal_point?) {should == true}
    its(:has_pence_sign?) {should == false}
  end

  context "double digit pound symbol" do
    subject {MoneySign.new("£10")}
    its(:has_pound_sign?) {should == true}
    its(:has_decimal_point?) {should == false}
    its(:has_pence_sign?) {should == false}
  end

end
