class RentalList
  def initialize(rentals)
    @rentals = rentals
  end

  def rentals_list
    print 'Enter rental ID : '
    id = gets.chomp.to_i

    desired_rentals = @rentals.select { |rental| rental.person.id == id }

    if desired_rentals.empty?
      puts 'No book rented for this person.'
    else
      puts 'Rentals: '
      desired_rentals.each do |rental|
        puts "Date : #{rental.date}, Title: #{rental.book.title}, Author :#{rental.book.author}."
      end
      puts
    end
  end
end
