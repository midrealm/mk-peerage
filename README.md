# Middle Kingdom Peerage Portal
live site http://peerage.midrealm.org

## Developer set up

### Prerequistes

* [docker](https://www.docker.com/)
* [docker compose](https://docs.docker.com/compose/install/)

### Instructions

1. Run the `init.sh` script:

    ```bash
    ./init.sh
    ```
    
    This will set up your .env file if you don't already have one, build the docker
    images, install the gems, and install the node modules. 
    
    For setting up the .env file, there's some logic to figure out what your UID
    and GID are so that the user in the container has the some UID and GID as you.
    Having those ids match means that files saved in the container (and then mapped
    to your workstation) will be owned by you. This has been a particular problem
    for Mac users.

2. Spin up the containers:

    ```bash
    docker compose up -d
    ```

3. Set up the database
    
    ```bash
    docker compose run --rm web bundle exec rails fake_data:all
    ```

    This will create the databases, load the schema, and load the fake data. (The script for this is in `lib/tasks/fake_data.rake`)

4. You probably need to turn the `web` container back on again.

   ```
   docker compose up -d 
   ```

   Use, `ps` to check that all of the containers are running

   ```
   docker compose ps
   ```

6. View the development site in the browser: http://localhost:3000

7. To run tests, in the terminal run:

   ```
   docker compose run --rm web bundle exec rspec
   ```
    
