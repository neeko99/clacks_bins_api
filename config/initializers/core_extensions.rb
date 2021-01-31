module CoreExtensions
  module String
    def despacer
      downcase.gsub(/\s/, '')
    end

    def consistentize
      downcase.strip
    end
  end
end


String.include CoreExtensions::String
