require File.dirname(__FILE__) + '/../../test_helper'

module TestFs
  class FilesystemTest < Test::Unit::TestCase

    describe "An instance of the TestFs class" do
      before { @fs = Filesystem.new }

      it "should know the :root_name" do
        @fs.expects(:sprintf).with('%s.%d.%d', 'TestFs::Filesystem', kind_of(Fixnum), 1).returns('blip')
        @fs.send(:root_name).should == 'blip'
      end

      it "should know the root of the filesystem" do
        Dir.expects(:tmpdir).with().returns('/tmp')
        @fs.expects(:root_name).with().returns('name')
        
        @fs.root.should == '/tmp/name'
      end
      
      it "should have an empty directory list by default" do
        @fs.directories.should == []
      end

      it "should be able to add a directory" do
        dir = stub()
      
        @fs.stubs(:root).with().returns('/root')
        Directory.expects(:new).with('/root', 'dir').returns(dir)
        
        @fs.dir 'dir'
        @fs.directories.should == [dir]
      end
      
      it "should be able to create the root directory" do
        @fs.stubs(:root).with().returns('/root')
        FileUtils.expects(:mkdir).with('/root')
        
        @fs.create!
      end
      
      it "should be able to create the underlying directories" do
        FileUtils.stubs(:mkdir)
        
        dir = mock {|m| m.expects(:create!).with() }
        
        @fs.stubs(:directories).with().returns([dir])
        @fs.create!
      end
      
      it "should be able to destroy the filesystem created" do
        @fs.expects(:root).with().returns('/root')
        FileUtils.expects(:rm_rf).with('/root')
        
        @fs.destroy!
      end
      
    end

  end
end