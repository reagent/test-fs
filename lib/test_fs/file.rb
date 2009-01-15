module TestFs
  class File
    
    def initialize(root_path, name)
      @root_path = root_path
      @name      = name
    end
    
    def path
      "#{@root_path}/#{@name}"
    end
    
    def create!
      FileUtils.touch(self.path)
    end
    
  end
end