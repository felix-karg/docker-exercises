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

## Exercise 1: Start Mysql contgainer
First you want to test the application locally with a mysql database. But you don't want to install Mysql, you want to get started fast, so you start it as a docker container:
- Start mysql container locally using the official Docker image. Set all needed environment variables.
- Export all needed environment variables for your application for connecting with the database (check variable names inside the code)
- Build a jar file and start the application. Test access from browser. Make some changes.

### Implementation Steps:
1. Search for MySQL image on [Docker Hub](hub.docker.com)
2. Start MySQL container and set environment variables with
   ```
   docker run \
   --name my-mysql \
   -e MYSQL_ROOT_PASSWORD=<my-password> \
   -e MYSQL_DATABASE=my-db \
   -e MYSQL_USER=my-user \
   -e MYSQL_PASSWORD=<some_password> \
   -p 3306:3306 \
   -d \
   mysql
   ```
3. Verify with `docker ps` that the container is running
4. Export variables set in the docker command above in the local CMD shell with
   ```
   set DB_USER=my-user
   set DB_PWD=<some_password>
   set DB_SERVER=localhost
   set DB_NAME=my-db
   ```
   For Unix-like systems use `export` command
5. Build application with `gradle build`
6. Start application with `java -jar ./build/libs/docker-exercises-project-1.0-SNAPSHOT.jar`
7. Open browser and navigate to `localhost:8080` to verify that the application is reachable