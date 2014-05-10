describe MoneySign do
  context "pence no decimal point" do
    subject {MoneySign.new("197p")}

    its(:pound_sign?) {should == false}
    its(:decimal_point?) {should == false}
    its(:pence_sign?) {should == true}
    its(:no_pound_and_no_decimal?) {should == true}
  end


  context "pounds decimal" do
    subject {MoneySign.new("1.87")}

    its(:pound_sign?) {should == false}
    its(:decimal_point?) {should == true}
    its(:pence_sign?) {should == false}
    its(:no_pound_and_no_decimal?) {should == false}
  end

  context "pound symbol" do
    subject {MoneySign.new("£1.23")}

    its(:pound_sign?) {should == true}
    its(:decimal_point?) {should == true}
    its(:pence_sign?) {should == false}
    its(:no_pound_and_no_decimal?) {should == false}
  end

  context "double digit pound symbol" do
    subject {MoneySign.new("£10")}

    its(:pound_sign?) {should == true}
    its(:decimal_point?) {should == false}
    its(:pence_sign?) {should == false}
    its(:no_pound_and_no_decimal?) {should == false}
  end

end
