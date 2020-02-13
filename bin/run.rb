require_relative '../config/environment'
require 'pry'
require 'pp'
require_relative '../db/seeds.rb'
require 'io/console'
require 'artii'
require_relative '../catpix.rb'

# Creating pseudocode

# Welcome to DebtFlix
A = Artii::Base.new

def openingWelcome
    puts "\n\nWelcome to DebtFlix\n\n"

    puts A.asciify('Debtflix!')

    puts " ________        _________     ________    ________________   "
    puts "|         \\     |   ______|   |   __   \\  |_____     ______|  "
    puts "|   ____   \\    |  |          |  |   \\  |       |   |         "
    puts "|  |    \\   \\   |  |_____     |  |___/  /       |   |         "
    puts "|  |     |   |  |   _____|    |   _____/__      |   |         "
    puts "|  |     |   |  |  |          |   ____    \\     |   |         "
    puts "|  |_____/  /   |  |_______   |  [____]   |     |   |         "
    puts "|_________ /    |__________|  |___________/     |___|         "
    puts " ___________   ___         __________     ___        ___            "
    puts "|   ________| |   |       |___    ___|   |   \\      /   |     "
    puts "|  |          |   |           |  |        \\   \\    /   /      "
    puts "|  |______    |   |           |  |         \\   \\__/   /       "
    puts "|   ______|   |   |           |  |          \\   __   /        "
    puts "|  |          |   |           |  |         /   /  \\   \\       "
    puts "|  |          |   |______  ___|  |____    /   /    \\   \\      "
    puts "|__|          |__________||___________|  |___/      \\___|     "

    puts "\nPress \"y\" to continue or type \"exit\" to terminate the program.\n\n"
    print "\nInput: "
    input = gets.chomp.downcase.gsub(" ", "")
    while input != "y" 
        if input == "exit"
            abort "\nExiting Program"
        end
        puts "\n**************************************************************"
        puts "An error occured please make sure you type \"y\" or \"exit\" only."
        puts "**************************************************************\n\n"
        print "Input: "
        input = gets.chop.downcase
        puts "\n"
    end
    loginMenu
    # if input.downcase == "y"
    #     loginMenu
    # else
    #     puts "Goodbye!"
    # end
end

def check_login
    i = 0
    while i < 3
        puts "\n**************************************************************"
        puts "\nPlease try again!"

        print "\nPlease enter your username: "
        usernames = gets.chomp
        print "\nPlease enter your password: "
        password = STDIN.noecho(&:gets).chomp

        user = User.login(usernames, password)
        if user
            return user
        end
        i += 1
    end
    return false

end

def loginMenu
    puts "\n**************************************************************"
    puts "\nPlease make a selection on the following: \n\n"
    puts "\t- 1 Log-in \n\n"
    puts "\t- 2 Create Account\n\n"
    puts "\t- 3 Exit Menu\n\n"
    print "\nInput: "
    input = gets.chomp.to_i

    if input == 1
        puts "\n**************************************************************"
        print "\nPlease enter your username: "
        usernames = gets.chomp.downcase
        print "\nPlease enter your password: "
        password = STDIN.noecho(&:gets).chomp
        user = User.login(usernames, password)

        if user
            puts "\nSuccess! Redirecting to homepage...\n\n"
            sleep 3
            puts "\e[H\e[2J"
            homepage(user)
        else
            puts ""
            user = check_login
            if user
                puts "\nSuccess! Redirecting to homepage...\n\n"
                sleep 3
                puts "\e[H\e[2J"
                homepage(user)
            else
                puts "\n**************************************************************"
                print "\nWould you like to create an account? y/n: "
                input = gets.chomp
                if input.downcase == "y"
                    user = acc_creation
                    if user
                        puts "\nSuccess! Account successfully created! Redirecting...\n\n"
                        sleep 3
                        puts "\e[H\e[2J"
                        homepage(user)
                    else
                        loginMenu
                    end
                else
                    puts "\nExiting program...\n\n"
                end
            end
        end
    elsif input == 2
        user = acc_creation
        if user
            puts "\nSuccess! Account successfully created! Redirecting...\n\n"
            sleep 3
            puts "\e[H\e[2J"
            homepage(user)
        else
            loginMenu
        end
    elsif input == 3
        puts "\e[H\e[2J"
        openingWelcome
    else
        puts "\e[H\e[2J"
        loginMenu
    end
end 

def homepage(user)
    puts A.asciify('Debtflix!')
    puts "\n**************************************************************"
    if user.status == false
        puts "\nWe are sorry, this service is only available to paying members. This is Debtflix, after all.\n\n"
        print "\nIf you would like to change your account status, press y/n: "
        input = gets.chomp.downcase

        if input == 'y'
            change_status(user)
            sleep 3
            puts "\nCongrats! You are now a member! Redirecting...\n\n"
            sleep 3
            puts "\e[H\e[2J"
            homepage(user)
        else
            puts "\nSecurely logging you out\n"
            sleep 3
            puts "\e[H\e[2J"
            loginMenu
        end
    else
        puts "\n\t- 1 Check if my account is active\n\n"
        puts "\t- 2 Search for show\n\n"
        puts "\t- 3 Watch a show\n\n"
        puts "\t- 4 Find a random show\n\n"
        puts "\t- 5 View account details\n\n"
        puts "\t- 6 Manage account settings\n\n"
        puts "\t- 7 Logout\n\n"     #return to loginMenu
    
        print "\nInput: "
        case gets.chomp.to_i

        when 1
            puts "\nYour current account status is #{user.status}.\n\n"
            print "\nWould you like to activate/deactivate your account?: y/n: "
            answer = gets.chomp.downcase

            if answer == "y"
                change_status(user)
                puts "\nYour account status has been successfully updated!\n\n"
                sleep 3

                puts "\e[H\e[2J"
                homepage(user)
            elsif answer == 'n'
                puts "\e[H\e[2J"
                homepage(user)
            else
                puts "\e[H\e[2J"
                homepage(user)
            end
        when 2
            puts "\e[H\e[2J"
            sleep 1
            populate_show_db
            puts "\e[H\e[2J"
            show_search(user)
        when 3
            watch_show(user)
            puts "\e[H\e[2J"
            homepage(user)
        when 4
            if Show.all.empty?
                puts "\nSearch for shows first so we can figure out your preferences!"
                sleep 3
                puts "\e[H\e[2J"
                homepage(user)
            else
                rand_show = Show.new(title: "")
                
                while !(user.queue.include?(rand_show.title))
                    rand_show_index = rand(Show.all.length)
                    rand_show = Show.all[rand_show_index]
                    
                    if !(user.queue.include?(rand_show.title))
                        puts "\nYour next exciting show will be #{rand_show.title}!\n\n"
                        user.add_show(rand_show.title)
                        sleep 3
                        break
                    end
                end
                
                puts "\e[H\e[2J"
                homepage(user)
            end
        when 5
            puts "\e[H\e[2J"
            acc_details(user)
        when 6
            puts "\e[H\e[2J"
            puts A.asciify('Manage Account')
            puts "\n**************************************************************"
            puts "\t- 1 Change username\n\n"
            puts "\t- 2 Change password\n\n"
            puts "\t- 3 Return to homepage\n\n"

            print "\nInput: "
            case gets.chomp.to_i

            when 1
                print "\nEnter a new username: "
                username = gets.chomp

                someone = User.find_by(id: user.id)
                someone.username = username
                someone.save
                binding.pry
                puts "\nSuccess! Your new username is #{User.find(user.id).username}!\n\n"
                sleep 3

                puts "\e[H\e[2J"
                homepage(someone)
            when 2
                print "\nEnter your current password: "
                password = STDIN.noecho(&:gets).chomp

                print "\nEnter a new password: "
                password = gets.chomp

                User.find_by(id: user.id).update(password: password)
                puts "\nSuccess! Your new password is #{User.find(user.id).password}!\n\n"
                sleep 3

                puts "\e[H\e[2J"
                homepage(user)
            else
                puts "\e[H\e[2J"
                homepage(user)
            end
        when 7
            puts "\nUntil next time!\n\n"
            sleep 3

            puts "\e[H\e[2J"
            openingWelcome
        else
            puts "\e[H\e[2J"
            homepage(user)
        end
    end
end

def acc_creation
    puts "\n**************************************************************"
    print "\nPlease enter your full name: "
    fullname = gets.chomp
    print "\nPlease enter a unique username: "
    username = gets.chomp
    print "\nPlease enter a password: "
    password = gets.chomp
    print "\nPlease enter your country of residence: "
    country = gets.chomp
    user = User.new(fullname: fullname, username: username, password: password, country: country, status: true)
    
    if User.exists?(username: user.username)
        puts "\nThis account already exists!\n\n"
    else
        User.create_account(fullname, username, password, country)
    end
end

def change_status(user)
    if user.status == true
        user.deactivate_account
    else
        user.activate_account
    end
end

def show_search(user)
    puts A.asciify('Search')
    puts "\n**************************************************************"
    if Show.all.empty?
        puts "\nLooks like there are no shows in your search! Try again!\n\n"
        return homepage(user)
    end

    puts "\nSearch for show based on: \n\n"
    puts "\t- 1 Rating\n\n"
    puts "\t- 2 Genre\n\n"
    puts "\t- 3 Network\n\n"
    puts "\t- 4 Title\n\n"
    puts "\t- 5 Return to Homepage\n\n"
    puts
    print "\nCurrent Queue: "
    pp user.queue
    print "\nFind By: "
    case gets.chomp.to_i

    when 1
        print "\nEnter a rating between 0-10: "
        rating = gets.chomp.to_f

        if rating > 0.0 && rating <= 10.0
            print "\nList of Shows with a rating of #{rating} or higher: "
            show_list = Show.sort_by_rating(rating)

            if show_list.empty?
                puts "\nLooks like there are no shows with that rating or higher!"
                populate_show_db
                sleep 3

                puts "\e[H\e[2J"
                return show_search(user)
            end

            p show_list

            print "\nPlease enter the name of the show that you would like to add: "
            show = gets.chomp.downcase
            temp = Show.where(title: show)
            new_show = Watchlist.new(user_id: user.id, show_id: temp[0].id)
            
            if Watchlist.find_by(user_id: new_show.user_id, show_id: new_show.show_id)
                puts "You already have that show! Returning to main menu\n\n"
                sleep 3

                puts "\e[H\e[2J"
                homepage(user)
            else
                user.add_show(show)
                puts "\nSuccess! Your show is waiting for you in your queue!\n\n"
                sleep 2

                puts "\e[H\e[2J"
                homepage(user)
            end
        else
            puts "Looks like that's not a valid rating! Redirecting to main menu..."
            sleep 3

            puts "\e[H\e[2J"
            homepage(user)
        end
    when 2
        

        p Genre.all_genres
        print "\nEnter a genre that you would like to search shows from: "
        input = gets.chomp.downcase
        show_list = Show.genre(input)

        if show_list.empty?
            puts "\nLooks like there are no shows with that genre!\n\n"
            populate_show_db
            sleep 3

            puts "\e[H\e[2J"
            return show_search(user)
        end

        p show_list

        print "\nPlease enter the name of the show that you would like to add: "
        show = gets.chomp.downcase
        temp = Show.where(title: show)
        new_show = Watchlist.new(user_id: user.id, show_id: temp[0].id)
        
        if Watchlist.find_by(user_id: new_show.user_id, show_id: new_show.show_id)
            puts "You already have that show! Returning to main menu\n\n"
            sleep 3

            puts "\e[H\e[2J"
            homepage(user)
        else
            user.add_show(show)
            puts "\nSuccess! Your show is waiting for you in your queue!\n\n"
            sleep 2

            puts "\e[H\e[2J"
            homepage(user)
        end
    when 3
        p Network.all_networks
        print "\nEnter a network that you would like to search shows from: "
        input = gets.chomp.downcase
        show_list = Show.network(input)

        if show_list.empty?
            puts "\nLooks like there are no shows in that network!\n"
            populate_show_db
            sleep 3

            puts "\e[H\e[2J"
            return show_search(user)
        end

        p show_list

        print "\nPlease enter the name of the show that you would like to add: "
        show = gets.chomp.downcase
        temp = Show.where(title: show)
        new_show = Watchlist.new(user_id: user.id, show_id: temp[0].id)
        
        if Watchlist.find_by(user_id: new_show.user_id, show_id: new_show.show_id)
            puts "You already have that show! Returning to main menu\n\n"
            sleep 3

            puts "\e[H\e[2J"
            homepage(user)
        else
            user.add_show(show)
            puts "\nSuccess! Your show is waiting for you in your queue!\n\n"
            sleep 2

            puts "\e[H\e[2J"
            homepage(user)
        end
    when 4
        print "\nHere is the current list of available shows: "
        p Show.all_titles

        print "\nPlease enter the name of the show that you would like to watch: "
        show = gets.chomp.downcase

        if Show.all_titles.include?(show)
            temp = Show.where(title: show)
            new_show = Watchlist.new(user_id: user.id, show_id: temp[0].id)
            
            if Watchlist.find_by(user_id: new_show.user_id, show_id: new_show.show_id)
                puts "You already have that show! Returning to main menu\n\n"
                sleep 3

                puts "\e[H\e[2J"
                homepage(user)
            else
                user.add_show(show)
                puts "\nSuccess! Your show is waiting for you in your queue!\n\n"
                sleep 2

                puts "\e[H\e[2J"
                homepage(user)
            end
        else
            puts "\nThat show does not exist!"
            sleep 3

            puts "\e[H\e[2J"
            show_search(user)
        end
    when 5
        puts "\e[H\e[2J"
        homepage(user)
    else
        puts "\nTry again!\n\n"
        sleep 3

        puts "\e[H\e[2J"
        show_search(user)
    end
end

def watch_show(user)
    if user.queue.empty?
        puts "\nYour queue is empty! Search for shows to add first!\n\n"
        sleep 3
        puts "\e[H\e[2J"
        homepage(user)
    end

    print "\nList of all shows in your queue: "
    pp user.queue

    print "\nWhat show would you like to watch? "
    input = gets.chomp.downcase

    if user.queue.include?(input)
        puts "\nEnjoy your show! Grabbing some popcorn...\n\n"
        time = (Show.find_by(title: input).runtime / 10).round
        user.remove_show(input)
        sleep 5

        puts "\e[H\e[2J"
        watch_movie(time)
        puts "\n\n*sniff* That one gets me everytime."
        sleep 3

        puts "\e[H\e[2J"
        homepage(user)
    else
        puts "\nLooks like that show isn't on your queue!\n\n"
        sleep 3

        puts "\e[H\e[2J"
        homepage(user)
    end

        
end

def acc_details(user)
    puts A.asciify('Account Details')
    puts "\n**************************************************************"
    # watchlist = Watchlist.where(user_id: self.id) 
    # 1 view all shows watched
        # 2 view watch time
        # 3 view size of queue

    puts "\nAccount Details:\n\n"
    puts "  Name: #{user.fullname}"
    puts "  Username: #{user.username}"
    puts "  Country: #{user.country}"
    puts "  Account Status: #{user.status}\n\n"
    puts "\t- 1 View current queue runtime\n\n"
    puts "\t- 2 View size of current queue\n\n"
    puts "\t- 3 Return to Homepage\n\n"

    print "\nInput: "
    case gets.chomp.to_i

    when 1
        puts "\nWow, looks like you're about to waste #{user.total_runtime} minutes! Nice job!\n\n"
        sleep 3

        puts "\e[H\e[2J"
        acc_details(user)
    when 2
        puts "\nYour current queue size is #{user.queue.length}.\n\n"
        sleep 3

        puts "\e[H\e[2J"
        acc_details(user)
    when 3
        puts "\e[H\e[2J"
        homepage(user)
    else
        puts "\e[H\e[2J"
        acc_details(user)
    end
end

def populate_show_db
    puts A.asciify('Search')
    puts "\n**************************************************************"
    print "\nPlease enter a search term for the show that you would like to add:\n"
    search_term = gets.chomp.downcase
    find_show(search_term)
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
