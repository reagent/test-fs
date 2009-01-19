module TestFs # :nodoc:
  
  # = RootDirectory
  #
  # Represents the root of the filesystem
  #
  class RootDirectory < Directory

    def initialize
      @nodes = []
    end

    # Retrieve the path for the generated root directory
    #
    def path
      "#{Dir.tmpdir}/#{name}"
    end
    
    # TODO: clear lists & value for root?
    # Recursively destroy the root filesystem
    #
    def destroy!
      FileUtils.rm_rf(self.path)
    end
    
    def name
      sprintf('%s.%d.%d', self.class.name, $$, 1)
    end
    private :name
    
  end
end