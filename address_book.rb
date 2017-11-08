require "./contact"

class AddressBook
  attr_reader :contacts
  def initialize
    @contacts = []
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    puts "Name search results (#{search})"
    results.each do |contact|
      puts contact.to_s("full_name")
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

  def print_contact_list
    puts "Contacts List"
    contacts.each do |contact|
      puts contact.to_s("last_first")
    end
  end
end

address_book = AddressBook.new

nick = Contact.new
nick.first_name = "Nick"
nick.middle_name = "Martin"
nick.last_name = "Fuentes"
nick.add_phone_number("Home",  "123-456-789")
nick.add_phone_number("Work",  "987-654-321")
nick.add_address("Home", "123 Main St.", "", "Portland", "OR", "12345")

jason = Contact.new
jason.first_name = "Jason"
jason.last_name = "Bourne"
jason.add_phone_number("Home", "123-345-2343")
jason.add_address("Home", "222 Two Lane", "", "Portland", "OR", "12345")

address_book.contacts.push(nick)
address_book.contacts.push(jason)

#address_book.print_contact_list

address_book.find_by_name("e")
