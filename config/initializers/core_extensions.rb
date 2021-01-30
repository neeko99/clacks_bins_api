module CoreExtensions
  module String
    def down_and_out
      downcase.gsub(/\s/, '')
    end
  end
end


String.include CoreExtensions::String
