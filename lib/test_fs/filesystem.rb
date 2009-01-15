module TestFs
  class Filesystem

    attr_reader :nodes
    
    def initialize
      @nodes = []
    end
    
    def root
      "#{Dir.tmpdir}/#{root_name}"
    end
    
    def dir(name)
      self.nodes << Directory.new(self.root, name)
    end
    
    def file(name)
      self.nodes << File.new(self.root, name)
    end
    
    def create!
      FileUtils.mkdir(self.root)
      self.nodes.each {|node| node.create! }
    end
    
    # TODO: clear lists & value for root?
    def destroy!
      FileUtils.rm_rf(self.root)
    end
    
    def root_name
      sprintf('%s.%d.%d', self.class.name, $$, 1)
    end
    private :root_name
    
  end
end