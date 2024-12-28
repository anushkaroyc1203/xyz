# My Flutter App

This is a simple Flutter application that demonstrates user authentication with a login page, a logout page, and a home page.

## Project Structure

```
my_flutter_app
├── lib
│   ├── main.dart          # Entry point of the application
│   ├── pages
│   │   ├── login_page.dart  # Login page with user input form
│   │   ├── logout_page.dart # Logout page displaying logout message
│   │   └── home_page.dart   # Main page after successful login
├── pubspec.yaml           # Flutter project configuration
└── README.md              # Project documentation
```

## Features

- **Login Page**: Users can enter their credentials to log in.
- **Home Page**: Displays user information and options after successful login.
- **Logout Page**: Confirms that the user has logged out and provides navigation options.

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd my_flutter_app
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the application:
   ```
   flutter run
   ```

## Usage

- Start the app to see the login page.
- Enter valid credentials to navigate to the home page.
- Use the logout option to navigate to the logout page.