module TestFs
  class RootDirectory < Directory

    attr_reader :nodes
    
    def initialize
      @nodes = []
    end
    
    def path
      "#{Dir.tmpdir}/#{name}"
    end
    
    # TODO: clear lists & value for root?
    def destroy!
      FileUtils.rm_rf(self.path)
    end
    
    def name
      sprintf('%s.%d.%d', self.class.name, $$, 1)
    end
    private :name
    
  end
end