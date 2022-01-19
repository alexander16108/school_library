require 'json'

class Get
    def read_book
        file = File.read('book.json')
        data_hash = JSON.parse(file)
    end
end


# File.open("./book.json", "r") do |file|
