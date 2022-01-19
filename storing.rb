require 'json'

class Storing
    def initialize(book)
      @books = book
    end
  
    def store_data
      data = []
      data.push(@books.to_json)
      send = JSON.dump(data)
      if !File.exist?("./book.json")
        File.new("./book.json", "w+")
      end
      File.write("./book.json", data)
    end
end

# @books.each do |book|
#     data.push(book)
#   end



# books = [{"Title"=>"My title", "Author"=>"My author"}]
# File.open("books.json", "w") { |f| f.puts books.to_json }