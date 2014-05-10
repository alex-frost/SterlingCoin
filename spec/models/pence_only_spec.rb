describe PenceOnly do
  subject {PenceOnly.new(amount_in_pence)}

  context "single digit" do
    let(:amount_in_pence) { "2" }

    its(:pence) {should == 2}
    its(:pounds) {should == 0}
  end

  context "double digit" do
    let(:amount_in_pence) { "78" }

    its(:pence) {should == 78}
    its(:pounds) {should == 0}
  end

  context "multiple digits" do
    let(:amount_in_pence) { "283" }

    its(:pence) {should == 83}
    its(:pounds) {should == 2}
  end

end

