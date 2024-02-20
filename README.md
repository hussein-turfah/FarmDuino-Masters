# FarmDuino-Masters

> FarmDuino is a desktop/mobile application designed to revolutionize greenhouse farming by providing an intuitive and efficient solution for controlling the farming environment.
> Our goal is to empower greenhouse owners to easily manage and customize their greenhouse conditions, leading to improved crop yields and optimized farming processes.

### To setup FarmDuino Server:
1. make a new folder in an accessible dir
2. open terminal there
3. git clone this repo
4. extract the contents outside the repo folder to the folder u created
5. delete the empty folder
6. type in : `docker-compose up -d` and wait to build all 3 containers
8. now open docker desktop and you can see all 3 are up and running
9. now you have enabled the server, you can see the endpoints to the backend from server files on vscode and use them in the mobile app
10. to close and power off the containers, simply run: `docker-compose stop` in the parent directory of the project (the folder u created) or through docker-desktop app, just select the stack named "farmduino" and stop it.
11. and that's it, when you want to:
            = run the server, just type: `docker-compose up`
            = stop the server, simply type `docker-compose stop` to stop all containers or through docker-dekstop app


NOTES 🚑:

    1. sql credentials on phpmyadmin are: usr: `root`, pass: `fdm24`

    2. ports are : `8000` for backend, `9001` for phpmyadmin, `3306` for sql server

    3. All containers can be called by `localhost` as their IP address -> ip for all containers is `localhost` ex: phpmyadmin: `localhost:9001` and so on

    4. the api address is through `127.0.0.1:8000` or `localhost:8000`
