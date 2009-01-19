require File.dirname(__FILE__) + '/../../test_helper'

class HelperImplementation
  include TestFs::Helper
end

module TestFs
  class HelperTest < Test::Unit::TestCase
    
    describe "An instance of HelperImplementation" do
      
      it "should have a setup_filesystem method" do
        hi = HelperImplementation.new
        hi.respond_to?(:setup_filesystem).should be(true)
      end
      
      it "should create a test filesystem when using the setup_filesystem helper" do
        hi = HelperImplementation.new
        
        root_directory = mock do |m|
          m.expects(:dir).with('dir')
          m.expects(:create!).with()
        end

        TestFs::RootDirectory.expects(:new).with().returns(root_directory)

        fs = hi.setup_filesystem do |root|
          root.dir 'dir'
        end

        fs.should == root_directory
      end

      
    end
    
  end
end