class User
  def full_name
    puts "Johnnie Walker"
  end
  alias name full_name
end

puts CONST = "This is a constant. They are in all caps."
puts "Stings can be either double quoted with interpolation and escape sequences. #{2+3} A new line:\n"
puts "Quote \', Double quote \", \a, \b, \f, \r, Tab: \t, \v"
puts 'Or single quoted with two escapes \' \\'
puts 45.class
puts 45.00.class
puts 9999999999999999999999999.class
puts (1..10).class
puts [1, 2, 3, 'banana'].class
print 'This should be a hash: ' 
puts Hash.new.class
puts hash = {King:10, 'Queen'=>'10'}.class
 
# :: is a reference to the constant of a class. class are considered constants.
