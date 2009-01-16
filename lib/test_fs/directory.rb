module TestFs
  class Directory < Node

    attr_reader :nodes

    def initialize(root_path, name)
      @nodes = []
      super(root_path, name)
    end
    
    def dir(name)
      directory = Directory.new(self.path, name)
      self.nodes << directory
      
      yield directory if block_given?
    end
    
    def file(name)
      self.nodes << File.new(self.path, name)
    end
    
    def create!
      FileUtils.mkdir(self.path)
      self.nodes.each {|node| node.create! }
    end
    
  end
end