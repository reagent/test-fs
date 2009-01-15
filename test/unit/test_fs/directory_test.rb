require File.dirname(__FILE__) + '/../../test_helper'

module TestFs
  class DirectoryTest < Test::Unit::TestCase
    
    describe "An instance of the TestFs::Directory class" do
      
      it "should know the full path to the directory" do
        dir = Directory.new('/path', 'dir')
        dir.path.should == '/path/dir'
      end
      
      it "should be able to create the underlying directory" do
        dir = Directory.new('/root', 'dir')
        FileUtils.expects(:mkdir).with('/root/dir')
        
        dir.create!
      end
      
    end
    
  end
end