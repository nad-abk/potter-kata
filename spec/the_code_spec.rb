require 'coding_dojo_2'

describe Potter do
  it "costs nothing for an empty basket" do
    subject.calculate([]).should == 0
  end

  it "should cost 8 for 1 book" do
    subject.calculate([1]).should == 8
    subject.calculate([2]).should == 8
    subject.calculate([3]).should == 8
    subject.calculate([4]).should == 8
    subject.calculate([5]).should == 8
  end

  it "should discount nothing for identical books" do
    subject.calculate([1, 1]).should == 8 * 2
    subject.calculate([2, 2, 2]).should == 8 * 3
  end

  it "should discount 5% for 2 different books" do
    subject.calculate([1, 2]).should == 8 * 2 * 0.95
  end

  it "should discount 10% for 3 different books" do
    subject.calculate([1, 3, 5]).should == 8 * 3 * 0.9
  end

  it "should discount 20% for 4 different books" do
    subject.calculate([1, 2, 3, 5]).should == 8 * 4 * 0.8
  end

  it "should discount 25% for 5 different books" do
    subject.calculate([1, 2, 3, 4, 5]).should == 8 * 5 * 0.75
  end

  it "should discount 5% for 2 different books out of 3" do
    subject.calculate([1, 1, 2]).should == 8 + (8 * 2 * 0.95)
  end

# [1, 1, 2, 2] -> [[1, 2] [1, 2] ]
  it "should discount 5% for 2 pairs of different books" do
    subject.calculate([1, 1, 2, 2]).should == 2 * (8 * 2 * 0.95)
  end

  it "should discount 5% and 20% for 2 and 4 different books" do
    subject.calculate([1, 1, 2, 3, 3, 4])
      .should == (8 * 2 * 0.95) + (8 * 4 * 0.8)
  end

  it "should discount 25% and nothing for 5 and 1 different books" do
    subject.calculate([1, 2, 2, 3, 4, 5])
      .should == 8 + (8 * 5 * 0.75)
  end

  it "should be clever about grouping different books" do
    subject.calculate([1, 1, 2, 2, 3, 3, 4, 5])
      .should == 2 * (8 * 4 * 0.8)
    subject.calculate([1, 1, 1, 1, 1 ,2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 5, 5, 5, 5])
      .should == 3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8)
  end
end
