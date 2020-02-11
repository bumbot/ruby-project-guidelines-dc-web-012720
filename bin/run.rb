require_relative '../config/environment'

# Creating pseudocode

# Welcome to DebtFlix
def openingWelcome
    puts "Welcome to DebtFlix"
    puts "Press enter to continue"
end

def loginMenu
    puts "Please make a selection on the following:"
    puts "\t- 1 Log-in"
    puts "\t- 2 Create Account"
    puts "\t- 3 Check if my account is active"
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



puts "HELLO WORLD"
openingWelcome
loginMenu
