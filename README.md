# DebtFlix Streaming Service

## Installing Debtflix

To install Debtflix is simple and can be installed following these steps:

  1. Fork/Clone the file to your local directory
  2. Open the file with your favorite text editor
  3. Open your terminal and type the following
  ```
  brew install imagemagick@6 && brew link imagemagick@6 --force
  ```
  4. Once the download is finished type the following
  ```
  bundle install

  ruby bin/run.rb
  ```
  4. After completing step 4 Debtflix will be up and running, enjoy.

## Using DebtFlix

![DebtFlix Startup](/img/debtflixStart.png)

Welcome to "DebtFlix," the new streaming service. We allow our members to view their favorite TV Shows and store TV Shows in their watchlist for viewing at a later time. DebtFlix members will be able to create an account with a username and a password. Returning members will have the ability to login with their credentials. Memebers who do not have an account will be given the option to create an account.

![Debtflix Login](/img/debtflixLogin.png)

![Debtflix Create Account](/img/debtflixCreateAccount.png)

After members have successfully signed into the service memebers will be presented with the main menu, providing options to check: if a member's account is active, search for a TV Show, find a random TV Show, view account details, manage account settings, and logout of the service. Once the member has given their selection, the program will direct the user to the selection. In the case the member has an account that is inactive, the member will instead be presented with the option to either activate their account or to logout of the service.

![Debtflix Create Account](/img/debtflixSearchShow.png)

The search for show option will allow the member the ability to establish a database of shows they want to select. After the member provides their selection, they will have the option to select shows by Rating, Genre, Network, and Title. Before the member has the ability to select an option, the service will show the member their current watchlist of shows. After the member has given their selection they will add a specific show given on the selection.

The "watch a show" option will allow the member to view a show from their watchlist. If the member's watchlist is empty the member will be notified of the issued and will be redirected to the homepage. When the member has at least one show in their watchlist, the user will have the ability to watch the first show on their watchlist. Once the memeber has finished watching their show, the member will be redirected to the homepage. 

The "find a random show" option will add a random show from their initial search from the database to the watch list of the member. 

![Debtflix Create Account](/img/debtflixAccountDetails.png)

The view account details option will allow our members to view their activity on the service. Once the member selects this option they will be presented with their account details including the member's: fullname, username, country, and account status. Then the member will have the option to select from the following options: view current watchlist runtime, view the size of their current watchlist, and to return to the homepage.

The manage account settings option will allow our members the option to change their username, change their password, and to return to the homepage.

