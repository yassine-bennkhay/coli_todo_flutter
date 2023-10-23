
## TODO APP Flutter.
This application consumes this [NodeJS API](https://github.com/yassine-bennkhay/colicoli_todo_api), it allows you to create, update, delete and read todos with different status, todo, in progress, and done.


#### Packages used
| Package | Version     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `flutter_bloc`      | `^8.1.3` | A state management solution. |
| `dio`      | `^5.3.3` |A powerful HTTP client library that simplifies the process of making HTTP requests. |
| `shimmer`      | `^3.0.0` | A package to create professional shimmer loading effects. |
| `flutter_svg`      | `^2.0.7` | A package to load SVGs in your Flutter app. |


## Installation

To get started clone the repo, and in your favorite IDE's terminal run the command
```bash
 flutter pub get
```
this command will install all the necessary packages.

#### Change the BaseUrl
This app depends on the NodeJS API mentioned above, so you must provide the ```BaseUrl``` where you hosted that API locally or online.
Go to the 
```  
lib->constants->strings.dart 
 ```
 and change the ```BaseUrl```.

Now from your terminal run the command
```bash
 flutter run
```
to run the app on your emulator or real device.

## How does the app communicate with the NodeJS Server?
Following the approach of ```Models```, ```Repositories```,```Services```, and ```Controllers/Cubit ```the app communicates with the server through the ```API``` in the ```Services``` layer where all the ```HTTP``` client methods are performed.
In the ```Repositories``` we get the ```Services``` responses and convert them to ```Dart``` objects via the ``` fromJson``` model's method.

Then the ```Cubit```takes the responsibility to handle the ```state```, and updates the UI accordingly.
## Screenshots

![App Screenshot](https://github.com/yassine-bennkhay/coli_todo_flutter/blob/main/screenshots/todos.png?raw=true)
