describe RemainingCoin do
  subject{RemainingCoin.new(93)}

  it do
    subject.num_in_denomination(50).should == 1
    subject.value.should == 43
    subject.num_in_denomination(20).should == 2
    subject.value.should == 3
    subject.num_in_denomination(10).should == 0
    subject.value.should == 3
  end

end

