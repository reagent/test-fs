module TestFs
  class Directory
    
    def initialize(root_path, name)
      @root_path = root_path
      @name      = name
    end
    
    def path
      "#{@root_path}/#{@name}"
    end
    
    def create!
      FileUtils.mkdir(self.path)
    end
    
  end
end