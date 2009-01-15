module TestFs
  class Directory < Node
    
    def create!
      FileUtils.mkdir(self.path)
    end
    
  end
end