class SessionView
  def ask_for(message)
    puts "#{message}?"
    gets.chomp.strip
  end

  def incorrect_username
    puts 'No such username'
  end

  def incorrect_password
    puts 'Wrong credentials... Try again!'
  end

  def succesful_sign_in(username)
    puts "Welcome #{username}!"
  end
end
