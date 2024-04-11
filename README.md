# Flutter Weather App

A Weather app made using Flutter and the [package name](https://pub.dev/packages/<package>) package.

## Flutter Project Setup

Follow these steps to set up the Flutter project using the code from this GitHub repository.

## 1. Create a new Flutter project

Open a terminal and run the following commands:

```bash
flutter create weather_app
cd weather_app
```

> Note if you name your project something else than `weather_app`, the imports may not work and need to be changed to the correct name!

## 2. Copy the `assets` folder

Copy the `assets` folder and all its contents to the root ot the project

## 3. Replace the contents of the `lib` folder

Replace the contents of the `lib` folder with the contents of the `lib` folder in this github repo

## 4. Add android location permissions

Navigate to `android > app > src > main > AndroidManifest.xml`

**Add the lines to the top of the file:**

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" /> <!--Add this line-->
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" /> <!--Add this line-->
    <application
        android:label="weather_app"
        <!--Rest of the file-->
```

## 5. Get and use your API key

**Go to OpenWeatherMap and sign in/sign up**

[https://home.openweathermap.org/api_keys]("https://home.openweathermap.org/api_keys")

**Copy an existing API key or generate a new one**

Paste the key into `lib > api_key.dart`

## 6. Replace the `pubspec.yaml` file

Delete the current `pubspec.yaml` file and copy the one from this repo to the root of your project

## 7. Install dependencies

```bash
flutter pub get
```

## 8. Run the app

```bash
flutter run
```

## The end result:

![Finland](outputs/img.png)
![Denmark](outputs/img2.png)
![Germany](outputs/img3.png)
![Spain](outputs/img4.png)
![Poland](outputs/img5.png)
