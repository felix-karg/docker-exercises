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

## Exercise 2: Start MySQL GUI container
Now you have a database, you want to be able to see the database data using a UI tool, so you decide to deploy phpmyadmin. 
Again, you don't want to install it locally, so you want to start it also as a docker container.
- Start phpmyadmin container using the official image.
- Access phpmyadmin from your browser and test logging in to your Mysql database

### Implementation Steps:
1. Search for phpMyAdmin image on [Docker Hub](hub.docker.com)
2. Run phpMyAdmin container with
   ```
   docker run \
   --name phpmyadmin \
   --link my-mysql:db \
   -p 8081:80 \
   -d \
   phpmyadmin
   ```
3. Open browser an navigate to `localhost:8081`
4. Login with MySQL credentials

## Exercise 3: Use docker-compose for MySQL and phpMyAdmin
You have 2 containers your app needs and you don't want to start them separately all the time. So you configure a 
docker-compose file for both:
- Create a docker-compose file with both containers
- Configure a volume for your DB
- Test that everything works again

### Implementation Steps:
1. Create Docker Compose YAML file (see `compose.yaml` in this repository)
2. Start containers with `docker-compose -f compose.yaml up`
3. Open phpMyAdmin at `localhost:8081` and login
4. Start application and edit an entry
5. Verify in phpMyAdmin that the change was applied in DB

## Exercise 4: Dockerize your Java Application
Now you are done with testing the application locally with Mysql database and want to deploy it on the server to make it 
accessible for others in the team, so they can edit information.

And since your DB and DB UI are running as docker containers, you want to make your app also run as a docker container. 
So you can all start them using 1 docker-compose file on the server. So you do the following:
- Create a Dockerfile for your java application

## Implementation Steps:
1. Search for Java image on [Docker Hub](hub.docker.com)
2. Write Dockerfile (see Dockerfile in this repository)

## Exercise 5: Build and push Java Application Docker Image
Now for you to be able to run your java app as a docker image on a remote server, it must be first hosted on a docker 
repository, so you can fetch it from there on the server. Therefore, you have to do the following:
- Create a docker hosted repository on Nexus
- Build the image locally and push to this repository

### Implementation Steps:
1. Login to Nexus repository with `docker login <nexus-ip>:<port-of-repo-connector>`
2. Retag image with `docker tag docker-exercises:1.0 <nexus-ip>:<port-of-repo-connector>/docker-exercises:1.0`
3. Push with `docker push <nexus-ip>:<port-of-repo-connector>/docker-exercises:1.0`
4. Browse Nexus repository to verify that the image is pushed successfully

## Exercise 6: Add application to docker-compose
- Add your application's docker image to docker-compose. Configure all needed env vars.
- Make all these environment variable values configurable, by setting them on the server when deploying.

### Implementation Steps:
1. Add service for Java app to `compose.yaml`
2. Replace hardcoded values of environment variables with variables
