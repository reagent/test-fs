module TestFs
  class File < Node
    
    def create!
      FileUtils.touch(self.path)
    end
    
  end
end