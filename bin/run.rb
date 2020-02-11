require_relative '../config/environment'
require 'pry'

# Creating pseudocode

# Welcome to DebtFlix
def openingWelcome
    puts "Welcome to DebtFlix"
    puts "Press y to continue"
    input = gets.chomp

    if input.downcase == "y"
        loginMenu
    else
        puts "Goodbye!"
    end
end

def check_login
    i = 0
    while i < 3
        puts "Please try again!"

        puts "Please enter your username"
        usernames = gets.chomp
        puts "Please enter your password"
        password = gets.chomp

        user = User.login(usernames, password)
        if user
            return user
        end
        i += 1
    end
    return false

end

def loginMenu
    puts "Please make a selection on the following:"
    puts "\t- 1 Log-in"
    puts "\t- 2 Create Account"
    puts "\t- 3 Exit Menu"
    input = gets.chomp.to_i

    if input == 1
        puts "Please enter your username"
        usernames = gets.chomp
        puts "Please enter your password"
        password = gets.chomp

        if User.login(usernames, password)
            user = User.login(usernames, password)
            puts "Success! Redirecting to homepage..."
            homepage(user)
        else
            user = check_login
            if user
                puts "Success! Redirecting to homepage..."
                homepage(user)
            else
                puts "Would you like to create an account? y/n"
                input = gets.chomp
                if input.downcase == "y"
                    user = acc_creation

                    puts "Success! Account successfully created"
                    homepage(user)
                else
                    puts "Exiting program..."
                end
            end
        end
    elsif input == 2
        user = acc_creation

        puts "Success! Account successfully created"
        homepage(user)
    elsif input == 3
        puts "Exiting program..."
    else
        loginMenu
    end
end 

def homepage(user)
    puts "\t- 1 Check if my account is active"
    puts "\t- 2 Search for show"
    puts "\t- 3 Watch a show"
    puts "\t- 4 Find a random show"
    puts "\t- 5 View account details"
    puts "\t- 6 Logout"     #return to login method
    
    case gets.chomp.to_i

    when 1
        puts "Your current account status is #{user.status}"
        puts "Would you like to activate/deactivate your account?: y/n"
        answer = gets.chomp.downcase

        if answer == "y"
            change_status(user)
            puts "Your account status has been successfully updated"
            homepage(user)
        else
            homepage(user)
        end
    when 2
        show_search(user)
    when 3

    when 4

    when 5

    when 6

    else

    end
end

def acc_creation
    puts "Please enter your full name: "
    fullname = gets.chomp
    puts "Please enter a unique username: "
    username = gets.chomp
    puts "Please enter a password:"
    password = gets.chomp
    puts "Please enter your country of residence"
    country = gets.chomp
    user = User.create_account(fullname, username, password, country)
end

def change_status(user)
    if user.status == true
        user.deactivate_account
    else
        user.activate_account
    end
end

def show_search(user)
    puts "Search for show based on: "
    puts "\t- 1 Rating"
    puts "\t- 2 Genre"
    puts "\t- 3 Network"
    puts "\t- 4 Title"
    puts "\t- 5 Return to Homepage"
    case gets.chomp.to_i

    when 1
        puts "Enter a rating between 0-10"
        rating = gets.chomp.to_f

        Show.sort_by_rating(rating)
        
    when 2

    when 3

    when 4

    when 5
        homepage(user)
    else
        puts "Try again"
        show_search(user)
    end
end


# Home menu to either Log in or create an account
    #1 will allow you to log in
        # if username/password/account DNE give error
    #2 will allow you to create an account
        # no 2 users can have the same username
    # 3 see if their account is active

# Once logged in user can 
    # 1 search for a show to add to queue
        # 1 ratings
            # best
            # worst
        # 2 genre
        # 3 network
        # 4 title
    # 2 watch a show in their queue
        # 1 first show
        # 2 specific show
        # 3 random show
    # 3 add ramdom show to their queue
    # 4 view user stats
        # 1 view all shows watched
        # 2 view watch time
        # 3 view size of queue
    # 5 user settings
        # 1 change username
        # 2 change password
        # 3 deactivate account
            # 1 confirm they want to deactivate
            # 2 go back/do not deactivate
    # 6 Logout/exit back to the main menu




openingWelcome
