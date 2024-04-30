class SessionsView
    def ask_for(thing)
        puts "#{thing.capitalize}?"
        return gets.chomp
    end

    def welcome(username)
        puts "Welcome #{username}!"
    end

    def wrong_credentials
        puts "Wrong credentials. Try again!"
    end
end