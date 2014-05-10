describe MoneySign do
  subject {MoneySign.new(amount)}

  context "pence no decimal point" do
    let(:amount) {"197p"}

    its(:pound_sign?) {should == false}
    its(:decimal_point?) {should == false}
    its(:pence_sign?) {should == true}
    its(:no_pound_and_no_decimal?) {should == true}
  end


  context "pounds decimal" do
    let(:amount) {"1.87"}

    its(:pound_sign?) {should == false}
    its(:decimal_point?) {should == true}
    its(:pence_sign?) {should == false}
    its(:no_pound_and_no_decimal?) {should == false}
  end

  context "pound symbol" do
    let(:amount) {"£1.23"}

    its(:pound_sign?) {should == true}
    its(:decimal_point?) {should == true}
    its(:pence_sign?) {should == false}
    its(:no_pound_and_no_decimal?) {should == false}
  end

  context "double digit pound symbol" do
    let(:amount) {"£10"}

    its(:pound_sign?) {should == true}
    its(:decimal_point?) {should == false}
    its(:pence_sign?) {should == false}
    its(:no_pound_and_no_decimal?) {should == false}
  end

end
