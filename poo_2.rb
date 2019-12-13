class Contact
  def initialize()
    @person1 = { age: 20, name: 'Jose', last_name: 'Lopez', gender: 'Masculino'.chr }
    @person2 = { age: 21, name: 'Oscar', last_name: 'Perez', gender: 'Masculino'.chr }
    @person3 = { age: 22, name: 'Martha', last_name: 'Sanchez', gender: 'Femenino'.chr }
  end

  def all
    @people = []

    @people.push(@person1)
    @people.push(@person2)
    @people.push(@person3)
    @people
  end

  def find_by(search_word)
    @people.find {|x| x[:age] == search_word}
  end
end

search = Contact.new
search.all
puts search.find_by(21)

