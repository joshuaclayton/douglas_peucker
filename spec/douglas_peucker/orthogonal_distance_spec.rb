require "spec_helper"

describe DouglasPeucker::OrthogonalDistance do
  context "with a horizontal line" do
    let(:line) do
      DouglasPeucker::Line.new(DouglasPeucker::Point.new(0,0), DouglasPeucker::Point.new(4,0))
    end

    it "calculates distance correctly" do
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(2, 0),  line).distance.should == 0
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(2, 2),  line).distance.should == 2
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(4, 4),  line).distance.should == 4
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(2, -2), line).distance.should == 2
    end
  end

  context "with a vertical line" do
    let(:line) do
      DouglasPeucker::Line.new(DouglasPeucker::Point.new(0,0), DouglasPeucker::Point.new(0,4))
    end

    it "calculates distance correctly" do
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(2, 0),  line).distance.should == 2
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(2, 2),  line).distance.should == 2
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(4, 4),  line).distance.should == 4
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(-2, 2), line).distance.should == 2
    end
  end

  context "with a sloped line" do
    let(:line) do
      DouglasPeucker::Line.new(DouglasPeucker::Point.new(0,0), DouglasPeucker::Point.new(4,4))
    end

    it "calculates distance correctly" do
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(1, 1), line).distance.should == 0
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(2, 2), line).distance.should == 0
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(4, 0), line).distance.should be_within(1e-9).of(2*2**0.5)
      DouglasPeucker::OrthogonalDistance.new(DouglasPeucker::Point.new(2, 0), line).distance.should be_within(1e-9).of(2**0.5)
    end
  end
end
