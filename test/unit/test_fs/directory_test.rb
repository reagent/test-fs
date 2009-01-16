require File.dirname(__FILE__) + '/../../test_helper'

module TestFs
  class DirectoryTest < Test::Unit::TestCase

    describe "An instance of the TestFs::Directory class" do

      it "should know the full path to the directory" do
        dir = Directory.new('/path', 'dir')
        dir.path.should == '/path/dir'
      end

      context "After initialization" do
        before do
          @root_path = '/root'
          @name      = 'dir'
          
          @dir = Directory.new(@root_path, @name)
        end
        it "should be able to create the underlying directory" do
          FileUtils.expects(:mkdir).with("#{@root_path}/#{@name}")
          @dir.create!
        end

        it "should have an empty node list by default" do
          @dir.nodes.should == []
        end

        it "should be able to add a directory" do
          dir = stub()
        
          @dir.stubs(:path).with().returns('/root')
          Directory.expects(:new).with('/root', 'dir').returns(dir)
          
          @dir.dir 'dir'
          @dir.nodes.should == [dir]
        end
        
        it "should be able to create the root directory" do
          @dir.stubs(:path).with().returns('/root')
          FileUtils.expects(:mkdir).with('/root')
          
          @dir.create!
        end
        
        it "should be able to create the underlying directories" do
          FileUtils.stubs(:mkdir)
          
          dir = mock {|m| m.expects(:create!).with() }
          
          @dir.stubs(:nodes).with().returns([dir])
          @dir.create!
        end
        
        it "should be able to add a file" do
          file = stub()
          @dir.stubs(:path).with().returns('/root')
          
          File.expects(:new).with('/root', 'file').returns(file)
          
          @dir.file 'file'
          @dir.nodes.should == [file]
        end
        
        it "should be able to create the underlying files" do
          FileUtils.stubs(:mkdir)
          
          file = mock {|m| m.expects(:create!).with() }
          @dir.stubs(:nodes).with().returns([file])
          
          @dir.create!
        end

      end
    end

  end
end