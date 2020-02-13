# DebtFlix Streaming Service

## Installing Debtflix

To install Debtflix is simple and can be installed following these steps:

  1. Fork/Clone the file to your local directory
  2. Open the file with your favorite text editor
  3. Open your terminal and type the following
  ```
  bundle install
  ruby bin/run.rb
  ```
  4. After completing step 3 Debtflix will be up and running, enjoy.

## Using DebtFlix

![DebtFlix Startup](/img/debtflixStart.png)

Welcome to DebtFlix the new streaming service. We allow our members to view their favorite TV Shows and store TV Shows in their watchlist for viewing on a later time. DebtFlix members will be able to create an account with a username and a password. Returning members will have the ability to login with their credentials. Memebers who do not have an account will be given the option to create an account.

![Debtflix Login](/img/debtflixLogin.png)

![Debtflix Create Account](/img/debtflixCreateAccount.png)

After members have successfully signed into the service memebers will be presented with the main menu providing options to check if a member's account is active, search for a TV Show, find a random TV Show, view account details, manage account settings, and logout of the service. Once the member has given their selection the program will direct the user to the selection. In the case the member has an account that is inactive the member will instead be presented with the option to either activate their account or to logout of the service.

![Debtflix Create Account](/img/debtflixSearchShow.png)

The search for show option will allow the memeber the ability to establish a database of shows they want to select. After the member provides their selection they will have the option to select shows by Rating, Genre, Network and, Title. Before the member has the ability to select an option the service will show the member their current watchlist of shows. After the member has given their selection they will add a specific show given on the selection.

The watch a show option will allow the member to view a show from their watchlist. If the member's watchlist is empty the member will be notified of the issued and will be redirected to the homepage. When the member has atleast one show in their watchlist the user will have the ability to watch the first show on their watchlist. Once the memeber has finished watching their show the member will be redirected to the homepage. 

The find a random show will add a random show from the initial search from the database to the watch list of the member. 

![Debtflix Create Account](/img/debtflixAccountDetails.png)

The view account details option will allow our members to view their activity on the service. Once the member selects this option they will be presented with their account details including the member's: fullname, username, country, and account status. Then the member will have the option to select from the following options: view current account runtime, view the size of their current watchlist and, to return to the homepage.

The manage account settings option will allow our members the option to change their username, change their password, and to return to the homepage.

<!-- Congratulations, you're at the end of module one! You've worked crazy hard to get here and have learned a ton.

For your final project, we'll be building a Command Line database application.

## Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

  **Resource:** [Easy Access APIs](https://github.com/learn-co-curriculum/easy-access-apis)

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate models for your runner and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. In example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project.(2 minutes max)
6. Prepare a presentation to follow your video.(3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address, if anything, what you would change or add to what you have today?
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
``` -->
