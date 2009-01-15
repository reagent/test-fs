module TestFs
  class Directory
    
    def initialize(path, name)
      @path = path
      @name = name
    end
    
    def path
      "#{@path}/#{@name}"
    end
    
    def create!
      FileUtils.mkdir(self.path)
    end
    
  end
end