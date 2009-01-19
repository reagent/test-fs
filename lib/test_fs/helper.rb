module TestFs # :nodoc:
  module Helper

    # Register and create a filesystem for use in tests.  Yields an instance of the 
    # root of the filesystem and returns that instance as well.  This method is automatically
    # mixed in to Test::Unit::TestCase
    #
    def setup_filesystem(&block)
      root_directory = TestFs::RootDirectory.new

      block.call(root_directory)
      root_directory.create!

      root_directory
    end

  end
end