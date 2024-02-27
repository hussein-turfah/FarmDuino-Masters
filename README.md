# <div style="color:white;">FarmDuino</div>

> FarmDuino is a desktop application designed to revolutionize greenhouse farming by providing an intuitive and efficient solution for controlling the farming environment.

> Our goal is to empower greenhouse owners to easily manage and customize their greenhouse conditions, leading to improved crop yields and optimized farming processes.

> We designed FarmDuino using wireframes and mockups, iterating on the design until we reached the ideal layout for easy navigation and a seamless user experience.

<br><br>

## <div style="color:white;">FarmDuino TechStack:</div>

- The project utilizes [Arduino](https://www.arduino.cc/), a versatile microcontroller platform, to collect and analyze data from various farm sensors and control interconnected actuators.
- The project's backend utilizes the power of [Laravel](https://laravel.com/), a robust PHP framework renowned for its rapid and efficient web application development capabilities.
- The Web version is crafted with [React.js](https://react.dev/), a widely adopted JavaScript library specifically designed for creating dynamic and engaging user interfaces.
- We leverage [Electron.js](https://www.electronjs.org/) to build a versatile desktop application that seamlessly runs on multiple operating systems, providing users with a consistent experience across platforms.
- As for the Mobile application, our project seeks the [Flutter](https://flutter.dev) programming language to further expand it's availability on almost all platforms, since flutter is known for it's cross-platform compatability.

<br><br>

## <div style="color: white;">Project Setup</div>

### <div style="color: white;">1. Locally (on host machine)</div>

To ensure the smooth functioning of your FarmDuino app, please make sure you have the following prerequisites installed on your computer:

- Visual C++ Redist Package **=> Windows Exclusive**
- PHP: Required for running the FarmDuino app built with the Laravel framework.
- Composer: A dependency manager for PHP used by Laravel and required for managing Laravel's dependencies.
- Node.js: A runtime environment for executing JavaScript code outside of a web browser and required for running ReactJS components in Electron.
- npm (Node Package Manager): A package manager for Node.js used for managing ReactJS package dependencies.
- Arduino IDE: An integrated development environment for Arduino used for programming the Arduino microcontroller and flashing the written code to it.
- MySQL: Database management system used by Laravel for data storage and retrieval.

#### <div style="color: white;">I. Dependency Setup on `Windows  (64bit arch is required!)`</div>

##### Ensure you have git installed, link to their site => [git-scm.com](https://git-scm.com/download/win)

##### a. Backend Wise

- Download and Install **Visual C++ Redistributable Package** from here => [x64 version](https://aka.ms/vs/17/release/vc_redist.x64.exe)
- Download **PHP runtime** zip file for [x64 (v8.3 as of now)](https://windows.php.net/downloads/releases/php-8.3.3-nts-Win32-vs16-x64.zip)
- Download **Composer PHP dependency manager** from => [here](https://getcomposer.org/Composer-Setup.exe)
- Download **MYSQL** through the installer => [v8.0.36.0 as of now](https://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-community-8.0.36.0.msi)

##### b. WebApp/DesktopApp Wise

- Download **NodeJS Runtime** installer to setup both nodejs and npm => [v20.11.1 as of now](https://nodejs.org/dist/v20.11.1/node-v20.11.1-x64.msi)

##### c. MobileApp Wise (If you wanted to build the app yourself)

- Download **Flutter SDK** => [v3.19.1 as of now](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.19.1-stable.zip)

##### d. Arduino Wise

- **Arduino IDE** => [v2.32 as of now](https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.2_Windows_64bit.exe)

After you downloaded all the dependencies you need in your case, let's guide you through installing everything and getting ready to make your plants smile ;)

1. Assuming that you installed the **visual c++ redist**, you can now proceed to install the **PHP** runtime. Just extract the downloaded zip file to a directory like `C:\php` and add it to env variables.
2. Install **Composer** by running the setup exe and going through the install configuration as any normal app installation procedure.
3. Install **MySQL** through the downloaded installer, go through the default config and choose the `developer default` install package as it contains the most common needed database tools in addition to the mysql server
4. Install **NodeJS** from the installer you downloaded, this will also install the node package manager "**npm**"
5. Install **flutter sdk** using the detailed tutorial => [here](https://docs.flutter.dev/get-started/install/windows/desktop?tab=download)
6. Install the **arduino ide**

#### <div style="color: white;">Project Setup on `Windows  (64bit arch is required!)`</div>

1. open windows **powershell** or **terminal** and navigate where you want to setup the project
2. Type `git clone https://github.com/hussein-turfah/FarmDuino-Masters` to clone it locally
3. Then type `cd FarmDuino-Masters`
4. to setup the
   - **Backend**, cd into `farmduino-server` and `php artisan migrate`, then `php artisan db:seed`
   - **Web/Desktop** app, cd into `farmduino-desktop`and type `npm install` to install react deps
   - **Mobile**, cd into `farmduino-mobileApp` and type `pub get` to fetch deps, then `flutter build apk` to build for android, and `flutter build ios` to build for ios (macos required to build for ios)
   - **Arduino**, just open the ide and connect your arduino then upload the code in `farmduino-arduino` to your board

<br><hr width="50%" color="white">

#### <div style="color: white;">II. Full Setup on `Linux`</div>

##### Ensure you have git installed, `sudo apt install git -y` for **debian**, or `sudo dnf install git` for **fedora**, or `sudo pacman -S git` for **arch** and **manjaro**

##### Backend Wise

- Download **PHP** with `sudo apt install php8.2` or relative cmd depending on your distro
- Download **required php extras** through `sudo apt install curl php8.2-curl php8.2-mysql -y` (reference to your distro commands to install these pkgs)
- Download **Composer PHP dependency manager** by `curl -sS https://getcomposer.org/installer -o composer-setup.php` then `sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer`
- Download **MYSQL** through the cmd `sudo apt install mysql-server` or seek your distro install reference

##### WebApp/DesktopApp Wise

- Download both **\*nodejs** and **npm** through `sudo apt install nodejs npm -y`

##### MobileApp Wise (If you wanted to build the app yourself)

- Download **Flutter SDK**, tutorial => [here](https://docs.flutter.dev/get-started/install/linux)

##### Arduino Wise

- **Arduino IDE** => [v2.32 as of now](https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.2_Linux_64bit.AppImage), => [tutorial](https://docs.arduino.cc/software/ide-v2/tutorials/getting-started/ide-v2-downloading-and-installing/)

Now after you downloaded all the dependencies you need in your case, let's guide you to get ready with the project and make your plants smile ;)

1. open **terminal** and navigate where you want to setup the project
2. Type `git clone https://github.com/hussein-turfah/FarmDuino-Masters` to clone it locally
3. Then type `cd FarmDuino-Masters`
4. to setup the
   - backend, cd into `farmduino-server` and `php artisan migrate`, then `php artisan db:seed`
   - web/desktop app, cd into `farmduino-desktop`and type `npm install` to install react deps
   - mobile, cd into `farmduino-mobileApp` and type `pub get` to fetch deps, then `flutter build apk` to build for android, and `flutter build ios` to build for ios
   - arduino, just open the ide and connect your arduino then upload the code in `farmduino-arduino` to your board

<br><hr width="50%" color="white">

### <div style="color:white;">2. ~~Locally (through [docker](https://docker.com))~~</div>

<br><hr width="50%" color="white">

### <div style="color:white;">Project Configuration</div>

#### To ensure full functioning of your famrduino system, please take note of these special configurations

#### <div style="color:white;">API Keys / Coordinates:</div>

- [OPENAI](https://openai.com/blog/openai-api)

- [Open Weather Map](https://openweathermap.org/api)

- [Trefle](https://trefle.io/)

These keys are required for the proper functioning of the app.
Configure API Keys: Inside `farmduino-server` folder, open the `.example.env` file, enter your obtained API keys for OpenAI, Open Weather Map the latitude and longitude of your greenhouse, and Trefle, and save the file as `.env`

```js
OPENAI_API_KEY = "ENTER YOUR API";
WEATHER_API_KEY = "ENTER YOUR API";
TREFLE_API_KEY = "ENTER YOUR API";
LATITUDE = "ENTER YOUR LATITUDE";
LONGITUDE = "ENTER YOUR LONGITUDE";
```

#### <div style="color: white;">Flashing the code to the Arduino</div>

1. Navigate to the `farmduino-arduino` folder.
2. Open the `farmduino-arduino.ino` file using the Arduino IDE.
3. Connect the Arduino board to your computer using a USB cable.
4. Select the Arduino board and port from the Tools menu in the Arduino IDE.
5. Click the Upload button in the Arduino IDE to flash the code to the Arduino.

### <div style="color:white;">Running the application</div>

#### To run after setup:

- type `php artisan serve` in `farmduino-server` dir to run the laravel backend
- to run electron or webApp, type `npm start` in `farmduino-desktop` dir
- install the Apk or the ios app respectively after building it to run the app on your mobile devices

### <div style="color:white;">Now, you should be able to run FarmDuino locally and explore its features 🤩.</div>
