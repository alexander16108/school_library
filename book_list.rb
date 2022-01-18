class BooksList
  def initialize
    @books = []
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp

    print 'Author: '
    book_author = gets.chomp

    puts 'Book created successfully!'

    book = Book.new(book_title, book_author)
    @books.push({
                  output: "Title: #{book.title}, Author: #{book.author}",
                  object: book
                })
  end

  def book_list
    @books.each do |book|
      puts book[:output]
    end
  end

  def rent_book
    @books.each_with_index do |book, index|
      puts "#{index}) #{book[:output]}"
    end
  end
end
