require File.dirname(__FILE__) + '/../spec_helper'

describe Wysiwyg do
  before(:each) do
    @wysiwyg = Wysiwyg.new
  end

  it "should be valid" do
    @wysiwyg.should be_valid
  end
end
