module TestFs # :nodoc:
  class Node # :nodoc:
    
    def initialize(root_path, name)
      @root_path = root_path
      @name      = name
    end
    
    def path
      "#{@root_path}/#{@name}"
    end
    
  end
end