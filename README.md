# 🧩 Flutter MVVM with Cubit State Management

## 🚀 Project Overview

A Flutter application demonstrating the Model-View-ViewModel (MVVM) architectural pattern combined with the Cubit state management solution from the Bloc library. This project showcases how to effectively separate concerns and manage state in a Flutter application with multiple features.

## ✨ Features

- 🏗️ MVVM architecture implementation
- 🔄 State management with Cubit
- 📝 Notes management (Create, Read, Update, Delete)
- 👤 User profile management
- 💬 Comments with infinite scrolling and pagination
- 🎨 Custom theme implementation

## 🛠️ Tech Stack

- ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
- ![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
- Bloc/Cubit State Management
- MVVM Architecture
- HTTP for API integration

## 📚 Learning Objectives

This project demonstrates:
- How to implement the MVVM pattern in Flutter
- How to use Cubit for state management
- How to separate business logic from UI
- How to reactive update UI when state changes
- How to handle user input and form management
- How to implement infinite scrolling with pagination
- How to create a custom theme

## 🏗️ Project Structure

The project follows a clean MVVM architecture:

- **Models**: Data classes that represent the application's data
  - `user_model.dart`: User data structure
  - `note_model.dart`: Note data structure
  - `comment_model.dart`: Comment data structure with JSON serialization

- **Views**: UI components that display data
  - `user_view.dart`: User profile management
  - `notes_list_view.dart`: Notes CRUD operations
  - `comments_list_view.dart`: Comments with infinite scrolling

- **Cubits**: Business logic and state management
  - `user_cubit.dart`: User state management
  - `note_cubit.dart`: Notes state management
  - `comment_cubit.dart`: Comments state management with API integration

- **Theme**: Custom theme implementation
  - `theme_data.dart`: Custom theme configuration

## 📁 Key Files

- `lib/main.dart`: Application entry point with MultiBlocProvider setup
- `lib/home.dart`: Main navigation screen
- `lib/models/`: Data models
- `lib/cubits/`: State management logic
- `lib/views/`: UI components
- `lib/theme/`: Theme configuration

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

```bash
# Clone the repository
git clone https://github.com/Alok-Sci/flutter--mvvm-with-cubit

# Navigate to project directory
cd flutter--mvvm-with-cubit

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## 📝 How It Works

### Notes Management
- Create, read, update, and delete notes
- Notes are stored in memory using Cubit state management
- UI updates automatically when notes are modified

### User Profile
- View and edit user information
- Form validation and state management with Cubit
- Real-time UI updates when profile is modified

### Comments
- Fetch comments from a REST API (JSONPlaceholder)
- Implement infinite scrolling with pagination
- Load more comments when scrolling to the bottom

## 🎯 Key Concepts Demonstrated

- MVVM architectural pattern implementation
- Cubit setup and state management
- Form handling with TextEditingControllers
- Reactive UI updates with BlocBuilder
- Clean separation of concerns
- API integration with HTTP
- Infinite scrolling with pagination
- Custom theme implementation
