# Exercises for Module "Containers with Docker" for DevOps Bootcamp by [TechWorld with Nana](https://www.techworld-with-nana.com/)
Use repository: https://gitlab.com/twn-devops-bootcamp/latest/07-docker/docker-exercises

Your team member has improved your previous static java application and added mysql database connection, to let users edit information and save the edited data.

They ask you to configure and run the application with Mysql database on a server using docker-compose.

## Exercise 0: Clone Git repository and create your own
You can check out the code changes and notice that we are using environment variables for the database and its credentials inside the application.

This is very important for 2 reasons:
- You don't want to expose the password to your database by hardcoding it into the app and checking it into the repository!
- These values may change based on the environment, so you want to be able to set them dynamically when deploying the application, instead of hardcoding them.

### Implementation Steps:
1. Clone [git repository](https://gitlab.com/twn-devops-bootcamp/latest/07-docker/docker-exercises)
2. Change upstream URL with `git remote set-url origin <url_of_your_git_repo>`
3. Check out file `DatabaseConfig.java` too see environment variables used for DB and credentials
