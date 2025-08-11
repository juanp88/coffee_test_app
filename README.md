# ☕ Coffee Test App

A Flutter application that demonstrates modern mobile development practices by allowing users to discover and save their favorite coffee images. This project showcases **Clean Architecture**, **State Management with Riverpod**, and **Local Data Persistence**.

## 🚀 Features

- **Random Coffee Discovery**: Fetch random coffee images from a REST API
- **Offline Favorites**: Save and view favorite coffee images locally using Hive
- **Responsive UI**: Clean Material Design interface with smooth navigation
- **Network Awareness**: Connectivity checking with user feedback
- **Image Caching**: Efficient image loading and caching
- **Full-Screen Viewing**: Tap to view images in full screen with zoom capabilities

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── Core/                    # Shared utilities and providers
│   ├── Providers/          # Riverpod providers configuration
│   ├── Routes/             # Navigation routing
│   └── utils/              # Constants and utilities
├── Data/                   # Data layer implementation
│   ├── local/              # Local storage (Hive)
│   ├── remote/             # API services (Dio)
│   ├── models/             # Data models
│   └── repositories/       # Repository implementations
├── Domain/                 # Business logic layer
│   ├── entities/           # Domain entities
│   ├── repository/         # Repository interfaces
│   └── usecases/           # Business use cases
└── Presentation/           # UI layer
    ├── viewModel/          # State management (Riverpod)
    ├── widgets/            # Reusable UI components
    └── screens/            # App screens
```

## 🛠️ Tech Stack

### **UI Composition**
- **Flutter Widgets**: Material Design components, custom layouts
- **Navigation**: Bottom navigation with multiple screens
- **State Management**: Riverpod for reactive state management
- **Image Handling**: Cached network images with loading states

### **Data Persistence**
- **Hive**: Local NoSQL database for storing favorites
- **Path Provider**: Device storage access
- **File System**: Local image storage and retrieval

### **Networking**
- **Dio**: HTTP client for REST API communication
- **Connectivity Plus**: Network status monitoring
- **Error Handling**: Comprehensive network error management

### **Additional Libraries**
- `riverpod_annotation` & `riverpod_generator` - Code generation for providers
- `go_router` - Declarative routing
- `photo_view` - Image zoom and pan functionality
- `cached_network_image` - Efficient image caching
- `mocktail` - Testing framework

## 📱 Screenshots & Demo

The app features:
- **Home Screen**: Load random coffee images with save functionality
- **Favorites Screen**: Grid view of saved coffee images
- **Full Screen View**: Zoomable image viewer
- **Loading States**: Smooth loading indicators and error handling

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.3.4)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/juanp88/coffee_test_app.git
   cd coffee_test_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (Required for Riverpod)
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Development Workflow

For continuous code generation during development:
```bash
dart run build_runner watch
```

This command watches for file changes and automatically generates Riverpod provider code.

## 🧪 Testing

Run the test suite:
```bash
flutter test
```

The project includes:
- **Unit Tests**: Repository and use case testing
- **Widget Tests**: UI component testing
- **Mock Testing**: Using Mocktail for dependency injection

## 📦 Build & Release

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🔧 Configuration

### API Endpoint
The app uses the Coffee API: `https://coffee.alexflipnote.dev/random.json`

To modify the API endpoint, update `lib/Core/utils/constants.dart`:
```dart
class Constants {
  static const baseUrl = 'https://your-api-endpoint.com';
  static const endpoint = "/your-endpoint";
}
```

### Local Storage
Favorites are stored locally using Hive. The database is automatically initialized on first run.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Coffee API](https://coffee.alexflipnote.dev/) for providing random coffee images
- Flutter team for the amazing framework
- Riverpod community for excellent state management solutions 
