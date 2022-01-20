require 'json'

class BooksList
  def initialize
    book_file = './book.json'
    f = File.read(book_file)
    if f.empty? == false
      json = JSON.parse(f)
      @books = []
      b = Book.new(json[0]['title'], json[0]['author'])
      @books.push(b)
    else
      @books = []
    end 
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp

    print 'Author: '
    book_author = gets.chomp

    puts 'Book created successfully!'

    book = Book.new(book_title, book_author)
    # @books.push("Title: #{book.title}, Author: #{book.author}")
    @books.push(book)
  end
  
  def book_list
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_book
    @books.each do |book|
       book
    end
  end

  def rent_book
    @books.each_with_index do |book, index|
      puts "#{index}) #{book[:output]}"
    end
  end
  
end
