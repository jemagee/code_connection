![Code Connection Logo](https://cloud.githubusercontent.com/assets/25189972/23142797/c240f1d6-f78b-11e6-8a86-24c99b6b2e3a.png)
> An attempt to bring scattered coders of all skiil levels and languages together to find people to learn from, work with, or projects to work on

## Where'd you get the idea?

Participating in a weekly twitter chat by [Code Newbie](http://www.codenewbie.org), someone mentioned the dificulty finding people to work with for a  reason specific to them.  That started me thinking how most of the time I'm working/learning on my own.  A variety of factors contribute to this on my end, but I realized that there might be others who have their own issues in regards to finding people to work with.  It could be geography, availability (some of us learning to code are doing so while also working full-time jobs and/or dealing with other obligations), skill level, language base, any number of things.  Thus I mentioned an idea to the chat folk regarding the idea of a web site where people could perhaps *register* to find others to work with based on whatever criteria was required.  It was an idea that stuck with me, and I decided to give it a try.  I created this repository to store what is now a [mission statement](https://github.com/jemagee/code_connection/blob/master/mission_statement.md) but was originally the README.md document of the repository.  If you want a deep insight into what I was thinking hopefully that helps.

### Platform

Code Connection is currently set up in the enviornment that I know best:
	
	* Rails 5 / Ruby 2.4.0
	* Postgres Database
	* RSpec / Capybara for testing
	* Bootstrap for Responsive Layout
	* Devise for User Creation foundation (to be added)

As I said, these are currently being used because I know them best, if you are interested in contributing but work better with something different, please feel free to suggest it.

### Contributing

Please, contribute.  Anyone who wants to contribute is welcome.  Use the Issues (or the new Projects tab if you want) as a way to make suggestions that you want to see or even want to create.  This is the initial README doc and as such the application doesn't have much, but as you can see above, we do have a great logo.  As such, the application is open to things, please read the mission statement, check the issues, and projects, and see what you might want to work on, or create a new idea for us to work on.

As I want code connection to follow the principles of test-driven development (as I understand them), please ensure that you've written tests to ensure your additions do what you wish them to do, and that you've run the whole test suite to make sure all existing tests pass.  



### Getting Started

	* Fork this repository 
	* Clone the fork to your local machine
	* Navigate into the folder on your local machine that has your cloned fork
	* Create an upstream remote that stays synched with this repository

If you aren't sure how to accomplish any of those steps above (the upstream one always gets me) this [Tutorial](https://help.github.com/articles/fork-a-repo/) by the good folks at GitHub should walk you through it

Within the folder on your local machine that contains your cloned fork:

	* If not your standard version, set the local ruby version to 2.4.0
	* Type bundle and hit enter to install all gems
	* Use postgres command line CREATEDB to create code_connection_test & code_connection_development
	* Type rails db:migrate and hit enter to create any database tables that might exist (reminder, don't forget to do this any time you synch with upstream in case new information is available)
	* Type rspec and hit enter to make sure all tests are passing


### Code of Conduct

The purpose of this project is to bring coders of all stripes together, and in that vein, be nice, be kind, be constructive, and be helpful.  It is my hope that coders from multiple coding ecosystems, countries, and levels will participant.  Treat everyone with respect.  Right?

