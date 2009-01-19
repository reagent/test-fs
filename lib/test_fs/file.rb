module TestFs # :nodoc:
  
  # = File
  #
  # Represents a single file node.
  #
  class File < Node
    
    # Create the current file
    #
    def create!
      FileUtils.touch(self.path)
    end
    
  end
end