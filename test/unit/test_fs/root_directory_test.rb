require File.dirname(__FILE__) + '/../../test_helper'

module TestFs
  class RootDirectoryTest < Test::Unit::TestCase

    describe "An instance of the TestFs class" do
      before { @root_dir = RootDirectory.new }

      it "should know the :root_name" do
        @root_dir.expects(:sprintf).with('%s.%d.%d', 'TestFs::RootDirectory', kind_of(Fixnum), 1).returns('blip')
        @root_dir.send(:name).should == 'blip'
      end

      it "should know the root of the filesystem" do
        Dir.expects(:tmpdir).with().returns('/tmp')
        @root_dir.expects(:name).with().returns('name')
        
        @root_dir.path.should == '/tmp/name'
      end
      
      it "should have an empty node list by default" do
        @root_dir.nodes.should == []
      end
      
      it "should be able to destroy the filesystem created" do
        @root_dir.expects(:path).with().returns('/root')
        FileUtils.expects(:rm_rf).with('/root')
        
        @root_dir.destroy!
      end
      
    end

  end
end