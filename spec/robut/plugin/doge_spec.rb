require 'spec_helper'
require 'robut/plugin/doge'

describe Robut::Plugin::Doge do
  before do
    @connection = Robut::ConnectionMock.new
    @presence = Robut::PresenceMock.new(@connection)
    @plugin = Robut::Plugin::Doge.new(@presence)
  end

  it "generates a doge meme with what you said" do
    @plugin.handle(Time.now, "noj", "@robut wow, such meme, so astound, wow!")
    @plugin.reply_to.replies.should eql(["http://dogr.io/wow/suchmeme/soastound/wow.png"])
  end

  it "generates a doge meme with what you said" do
    @plugin.handle(Time.now, "noj", "@robut doge wow, such meme, so astound, wow!")
    @plugin.reply_to.replies.should eql(["http://dogr.io/wow/suchmeme/soastound/wow.png"])
  end

  it "does nothing if it's not mentioned" do
    @plugin.handle(Time.now, "noj", "wow, such meme, so astound, wow!")
    @plugin.reply_to.replies.should eql([])
  end
end
