require 'spec_helper'
require 'robut/plugin/hug'

describe Robut::Plugin::Hug do
  before do
    @connection = Robut::ConnectionMock.new
    @presence = Robut::PresenceMock.new(@connection)
    @plugin = Robut::Plugin::Hug.new(@presence)
  end

  it "gives you a hug when you need it" do
    @plugin.handle(Time.now, "noj", "@robut I need a hug...")
    @plugin.reply_to.replies.should eql(["https://dl.dropboxusercontent.com/u/9921601/virtual-hug.gif"])
  end

  it "gives you a hug when you need it even in upper case" do
    @plugin.handle(Time.now, "noj", "@robut I need a HUG...")
    @plugin.reply_to.replies.should eql(["https://dl.dropboxusercontent.com/u/9921601/virtual-hug.gif"])
  end

  it "does nothing if it's not mentioned" do
    @plugin.handle(Time.now, "noj", "I need a hug...")
    @plugin.reply_to.replies.should eql([])
  end
end
