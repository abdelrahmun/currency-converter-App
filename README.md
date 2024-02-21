# Currency Converter

## Overview

This Flutter project follows a clean architecture pattern with MVC (Model-View-Controller) as the base architecture, Isar for local storage, GetIt for dependency injection, BLoC for state management, and includes unit tests for robust code quality. Additionally, the project utilizes `cached_network_image` for efficient caching of network images.

## Project Structure

```
currency_converter/
|-- assets/
|-- lib/
|   |-- data/
|   |   |-- models/
|   |   |-- repositories/
|   |   |-- sources/
|		|   |   |-- local/
|		|   |   |-- remote/

|   |-- application/
|   |   |-- services/
|-- ui
|		|   |-- common/
|   |   |-- modules/
|   |   |-- style/
|-- utils
|-- bloc
|-- main.dart

```

## MVC Architecture

- **Model:** The data layer of the application, responsible for handling data-related logic.
- **View:** The UI layer, responsible for displaying data and receiving user input.
- **Controller:** Acts as an intermediary between the Model and View, handling user input and updating the Model.

## Isar for Local Storage

Isar is used as a local storage solution. Data models and repositories are defined in the `data` directory, allowing easy integration with the MVC architecture.

## GetIt for Dependency Injection

GetIt is used for dependency injection to manage the project's services and components. Services are registered in the `application` directory.

## BLoC Pattern

BLoC (Business Logic Component) is employed for state management. BLoCs are implemented in the `presentation/controllers` directory and interact with the Model and View through the Controller.

## Cached Network Image

The project uses `cached_network_image` for efficient caching of network images. This library is chosen to enhance the performance of loading and displaying images by caching them locally. This is particularly beneficial in scenarios where network bandwidth might be limited or unstable.

## Justification my Choices

- **CachedNetworkImage:**
    - **Efficient Caching:** Reduces data usage and improves loading times, especially on slower connections or mobile networks.
    - **Offline Support:** Allows users to access previously viewed images even without an internet connection, enhancing the user experience.
    - **Image Placeholder/Loading Indicator:** Provides visual feedback during image loading, improving user experience and perception of app responsiveness.
    - **Image Scaling and Optimization:** Offers built-in features for image scaling and optimization, reducing memory footprint and improving performance.
- **Isar Library:**
    - **High Performance:** Isar is known for its exceptional speed and efficiency, making it ideal for demanding applications.
    - **Offline Capabilities:** Enables offline data persistence and retrieval, ensuring seamless user experience even without internet connectivity.
    - **Data Modeling Simplicity:** Offers a user-friendly API for defining data models, making it easier to manage and interact with your app's data.
    - **Encryption Support:** Provides optional encryption for sensitive data, enhancing security and privacy.
- **Bloc Pattern:**
    - **Clean Architecture:** Separates UI, business logic, and data layers, promoting maintainability and testability.
    - **Predictable State Management:** Events and states clearly represent app state changes, making debugging and reasoning easier.
    - **Scalability and Reusability:** Blocs are modular and reusable, facilitating development of complex features and larger applications.
    - **Testability:** Blocs are designed for unit testing, ensuring code quality and robustness.

## Unit Testing

The project includes unit tests to ensure code quality and functionality. Run the tests using:

```bash
flutter test

```

## Built With

- Flutter
- Dart
- Isar
- GetIt
- BLoC
- Cached Network Image
