module TestFs
  class Filesystem

    attr_reader :directories
    
    def initialize
      @directories = []
    end
    
    def root
      "#{Dir.tmpdir}/#{root_name}"
    end
    
    def dir(name)
      @directories << Directory.new(self.root, name)
    end
    
    def create!
      FileUtils.mkdir(self.root)
      directories.each {|dir| dir.create! }
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