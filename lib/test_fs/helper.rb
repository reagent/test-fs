module TestFs
  module Helper

    def setup_filesystem(&block)
      root_directory = TestFs::RootDirectory.new

      block.call(root_directory)
      root_directory.create!

      root_directory
    end

  end
end