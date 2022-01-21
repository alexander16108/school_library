require 'json'

class BooksList
  def initialize
      @books = []
      @books.push(json)
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
    @books.push("Title: #{book.title}, Author: #{book.author}")
  end

  def book_list
    @books.each do |book|
      puts book
    end
  end

  def list_book
    @books.each do |book|
      book
    end
  end

  def rent_book
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Author: #{book.author}, Title: #{book.title}"
    end
  end
end
