module TestFs # :nodoc:
  
  # = Directory
  #
  # Represents a single directory node.
  #
  class Directory < Node

    # A collection of sub-directories or files contained in this directory
    #
    attr_reader :nodes

    # Create a new directory at the given path with the supplied name
    #
    def initialize(root_path, name)
      @nodes = []
      super(root_path, name)
    end
    
    # Register a sub-directory under the current directory
    #
    def dir(name)
      directory = Directory.new(self.path, name)
      self.nodes << directory
      
      yield directory if block_given?
    end
    
    # Register a file under the current directory
    #
    def file(name)
      self.nodes << File.new(self.path, name)
    end
    
    # Create the current directory and any associated nodes (files / directories)
    #
    def create!
      FileUtils.mkdir(self.path)
      self.nodes.each {|node| node.create! }
    end
    
  end
end