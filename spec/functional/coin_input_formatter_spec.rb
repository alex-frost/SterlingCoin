describe CoinInputFormatter do
  #\|\s\|\s(\S+?)\s\|\s(\d*?)\s\|\s(.*)

  subject {CoinInputFormatter.new(input_amount)}

  context "single digit" do
    let(:input_amount) {"4"}

    its(:pounds) {should == 0}
    its(:pence)  {should == 4}
    its(:valid?) {should == true}
  end

  context "double digit" do
    let(:input_amount) {"85"}

    its(:pounds) {should == 0}
    its(:pence) {should == 85}
    its(:valid?) {should == true}
  end

  context "pence symbol" do
    let(:input_amount) {"197p"}

    its(:pounds) {should == 1}
    its(:pence) {should == 97}
    its(:valid?) {should == true}
  end

  context "pence symbol single digit" do
    let(:input_amount) {"2p"}

    its(:pounds) {should == 0}
    its(:pence) {should == 2}
    its(:valid?) {should == true}
  end

  context "pounds decimal" do
    let(:input_amount) {"1.87"}

    its(:pounds) {should == 1}
    its(:pence) {should == 87}
    its(:valid?) {should == true}
  end

  context "pound symbol" do
    let(:input_amount) {"£1.23"}

    its(:pounds) {should == 1}
    its(:pence)  {should == 23}
    its(:valid?) {should == true}
  end

  context "single digit pound symbol" do
    let(:input_amount) {"£2"}

    its(:pounds) {should == 2}
    its(:pence) {should == 0}
    its(:valid?) {should == true}
  end

  context "double digit pound symbol" do
    let(:input_amount) {"£10"}

    its(:pounds) {should == 10}
    its(:pence) {should == 0}
    its(:valid?) {should == true}
  end

  context "pound and pence symbol" do
    let(:input_amount) {"£1.87p"}

    its(:pounds) {should == 1}
    its(:pence) {should == 87}
    its(:valid?) {should == true}
  end

  context "missing pence" do
    let(:input_amount) {"£1p"}

    its(:pounds) {should == 1}
    its(:pence) {should == 0}
    its(:valid?) {should == true}
  end

  context "missing pence but present decimal point" do
    let(:input_amount) {"£1.p"}

    its(:pounds) {should == 1}
    its(:pence) {should == 0}
    its(:valid?) {should == true}
  end

  context "buffered zeros" do
    let(:input_amount) {"001.41p"}

    its(:pounds) {should == 1}
    its(:pence) {should == 41}
    its(:valid?) {should == true}
  end

  context "rounding three decimal places to two" do
    let(:input_amount) {"4.235p"}

    its(:pounds) {should == 4}
    its(:pence) {should == 24}
    its(:valid?) {should == true}
  end

  context "rounding with symbols" do
    let(:input_amount) {"£1.257422457p"}

    its(:pounds) {should == 1}
    its(:pence) {should == 26}
    its(:valid?) {should == true}
  end

  context "empty string" do
    let(:input_amount) {""}

    its(:valid?) {should == false}

    it "pounds to be graceful" do
      expect {subject.pounds}.to_not raise_error
    end

    it "pence to be graceful" do
      expect {subject.pence}.to_not raise_error
    end
  end

  context "non-numeric character" do
    let(:input_amount) {"£1x.0p"}

    its(:valid?) {should == false}

    it "pounds to be graceful" do
      expect {subject.pounds}.to_not raise_error
    end

    it "pence to be graceful" do
      expect {subject.pence}.to_not raise_error
    end
  end

  context "missing digits" do
    let(:input_amount) {"£p"}

    its(:valid?) {should == false}

    it "pounds to be graceful" do
      expect {subject.pounds}.to_not raise_error
    end

    it "pence to be graceful" do
      expect {subject.pence}.to_not raise_error
    end
  end
end

