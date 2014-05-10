describe PoundAndPence do
  subject { PoundAndPence.new(input_amount) }

  context "pounds decimal" do
    let(:input_amount) {"1.87"}

    its(:pounds) {should == 1}
    its(:pence) {should == 87}
  end

  context "rounding three decimal places to two" do
    let(:input_amount) {"4.235"}

    its(:pounds) {should == 4}
    its(:pence) {should == 24}
  end

  context "handels invalid pounds input" do
    let(:input_amount) { "12x" }

    it "logs the error"do
      Rails.logger.should_receive(:error)
      subject.pounds.should == nil
      subject.pence.should == 0
    end
  end

  context "handels invalid pence input" do
    let(:input_amount) { "1.2x" }

    it "logs the error"do
      Rails.logger.should_receive(:error)
      subject.pounds.should == 1
      subject.pence.should == nil
    end
  end
end
