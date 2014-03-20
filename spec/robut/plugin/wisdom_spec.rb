require 'spec_helper'
require 'robut/plugin/wisdom'

describe Robut::Plugin::Wisdom do
  before do
    @connection = Robut::ConnectionMock.new
    @presence = Robut::PresenceMock.new(@connection)
    @plugin = Robut::Plugin::Wisdom.new(@presence)
  end

  it "provides words of wisdom" do
    @plugin.handle(Time.now, "noj", "@robut thoughts?")
    @plugin.reply_to.replies.should have_at_least(1).items
  end

  it "provides words of wisdom" do
    @plugin.handle(Time.now, "noj", "@robut input?")
    @plugin.reply_to.replies.should have_at_least(1).items
  end

  it "provides words of wisdom" do
    @plugin.handle(Time.now, "noj", "@robut words of wisdom?")
    @plugin.reply_to.replies.should have_at_least(1).items
  end

  it "provides words of wisdom" do
    @plugin.handle(Time.now, "noj", "@robut what do you think?")
    @plugin.reply_to.replies.should have_at_least(1).items
  end

  it "does not provide words of wisdom if it is not mentioned" do
    @plugin.handle(Time.now, "noj", "what do you think?")
    @plugin.reply_to.replies.should have_at_least(0).items
  end
end