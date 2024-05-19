# Coffee App

This Flutter application allows users to save their favorite coffee images. The app uses the Riverpod package for state management and follows clean architecture principles.

## Features

- Load a random coffee image from the internet.
- Save favorite coffee images locally.
- View favorite coffee images offline.

## Setup

1. Clone the repository:

    ```sh
    git clone https://github.com/your_username/coffee_app.git
    cd coffee_app
    ```

2. Install dependencies:

    ```sh
    flutter pub get
    ```

3. Run the application:

    ```sh
    flutter run
    ```

## Other considerations

This project uses Riverpod annotations and Riverpod generator for related features, so it's necessary ro run the build_runner command 
to make sure any change related with this annotations it's properly implemented:

Generate Riverpod Code: Use the build_runner package to generate necessary Riverpod code:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```
