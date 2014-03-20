require 'spec_helper'
require 'robut/plugin/points'

describe Robut::Plugin::Points do
  before do
    @connection = Robut::ConnectionMock.new
    @presence = Robut::PresenceMock.new(@connection)
    @plugin = Robut::Plugin::Points.new(@presence)
  end

  it "give points" do
    @plugin.handle(Time.now, "noj", "hahaha @JajaB +1 cause he's funny.")
    @plugin.reply_to.replies.should eql(["/me records your points in the background, like a ninja in the shadows."])
  end

  it "take away points" do
    @plugin.handle(Time.now, "noj", "boo @LV -2 cause he forgot to feed iggy")
    @plugin.reply_to.replies.should eql(["/me records your points in the background, like a ninja in the shadows."])
  end

  it "should show points" do
    @plugin.handle(Time.now, "LV", "@robut show points")
    @plugin.reply_to.replies.should eql(["JajaB:\t1", "LV:\t-2"])
  end

  it "should not show points if not mentioned" do
    @plugin.handle(Time.now, "LV", "show points")
    @plugin.reply_to.replies.should eql([])
  end

  context "25% of the time" do
    before do
      Random.stub(:rand).and_return(10)
    end

    it "let's you give points to yourself" do
      @plugin.handle(Time.now, "JajaB", "hahaha @JajaB +1 cause he's funny.")
      @plugin.reply_to.replies.should eql(["/me is amused by your antics.  Points have been awarded."])
    end
  end

  context "75% of the time" do
    before do
      Random.stub(:rand).and_return(50)
    end

    it "doesn't let you give points to yourself" do
      @plugin.handle(Time.now, "JajaB", "hahaha @JajaB +1 cause he's funny.")
      @plugin.reply_to.replies.should eql(["/me is not amused."])
    end
  end

  it "lets you give yourself negative points." do
    @plugin.handle(Time.now, "noj", "can I give me, @noj -2 points?")
    @plugin.reply_to.replies.should eql(["/me records your points in the background, like a ninja in the shadows."])
  end

end
