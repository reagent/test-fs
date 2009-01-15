require File.dirname(__FILE__) + '/../../test_helper'

module TestFs
  class FileTest < Test::Unit::TestCase
    
    describe "An instance of the TestFs::File class" do
      
      it "should know its path" do
        file = File.new('/path', 'name')
        file.path.should == '/path/name'
      end
      
      it "should be able to create the underlying file" do
        file = File.new('/path', 'name')
        FileUtils.expects(:touch).with('/path/name')
        
        file.create!
      end
      
    end
    
  end
end