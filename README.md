# Vodafone UI Clone

A Flutter mobile app interface inspired by the Vodafone Cash application, featuring modern UI design, smooth animations, and clean architecture.

## 📱 Screenshots

The app replicates the Vodafone app interface with:
- Home screen with balance cards and service grid
- Offers screen with filtering
- Messages/Notifications screen
- Profile management
- Additional services (More screen)

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/
│   ├── theme/              # App theming (colors, text styles, dimensions)
│   ├── constants/          # App-wide constants (strings, assets)
│   ├── routes/             # Navigation and routing
│   ├── utils/              # Utilities (cache helper)
│   ├── widgets/            # Reusable animated widgets
│   ├── mock_data/          # Mock data for development
│   └── di/                 # Dependency injection setup
├── features/
│   ├── home/               # Home screen feature
│   │   ├── presentation/   # UI (screens, widgets)
│   │   ├── domain/         # Business logic (entities, use cases)
│   │   └── data/           # Data layer (models, repositories)
│   ├── offers/             # Offers screen feature
│   ├── messages/           # Messages/Notifications feature
│   ├── profile/            # Profile management feature
│   └── more/               # Additional services feature
└── presentation/
    └── widgets/            # App-level widgets (main wrapper, bottom nav)
```

## 🎨 Design System

### Colors
- **Primary Red**: `#E60000` (Vodafone brand color)
- **Background**: `#F5F5F5` (Light gray)
- **Card White**: `#FFFFFF`
- **Text**: Dark gray (`#333333`), Medium gray (`#666666`), Light gray (`#999999`)

### Key Features
- Responsive layout with SafeArea handling
- Custom theme with Arabic/English text support
- Consistent spacing and dimensions
- Shadow and elevation styles matching Vodafone design

## 🚀 Features

### Home Screen
- **Top App Bar**: Red header with search icon and Vodafone logo
- **Promotional Carousel**: PageView with dot indicators showing campaigns
- **Balance Card**: 
  - Displays current usage (572/500 flex)
  - Progress bar visualization
  - Days remaining counter
  - Action buttons (Manage Package, Repurchase)
- **Service Grid**: 2x2 grid of main services
  - Recharge Balance
  - Online Shop
  - Movies & Music
  - Vodafone Cash (dark themed)
- **October Offers**: Horizontal scrollable promotional cards

### Offers Screen
- Featured offer card with call-to-action
- Filter chips (All Offers, Flex, Entertainment)
- Grid of offer cards with descriptions
- Smooth filtering animations

### Messages Screen
- Notification cards with different types (promo, achievement)
- Timestamp display
- Red-themed promotional notifications
- Achievement badges

### Profile Screen
- Quick action icons (Travel, Transfer, etc.)
- User profile card with avatar
- Account switcher buttons
- App version indicator
- Settings sections:
  - Payments (Previous payments, Manage cards)
  - Address management
  - Settings (Language, Notifications, Change Password, Logout)

### More Screen
- List of additional services
- "New" badges for recent features
- Services include:
  - Moneyback
  - Contact Us
  - eSIM
  - WiFi Calling
  - 5G
  - Rewards Program
  - Balance Services
  - My Devices

### Bottom Navigation
- 5-item navigation bar
- Persistent state with IndexedStack
- Smooth transitions
- Icons: Home, Offers, Profile, Messages, More

## 🎬 Animations

- **Fade-in animations** for balance cards
- **Slide-up animations** for service grid items (staggered delay)
- **Carousel animations** with page indicators
- **Pull-to-refresh** functionality on home screen
- **Shimmer loaders** for loading states
- **Smooth transitions** between bottom navigation tabs

## 💾 Data & Caching

### Strategy
1. Load cached data immediately on app launch
2. Display cached data for instant UI
3. Fetch updated data in background (simulated)
4. Update UI and cache on success
5. Show offline indicator on failure

### Cache Keys
- `cached_balance` - User balance data
- `cached_services` - Available services


## 📦 Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.3          # State management
  equatable: ^2.0.5             # Value equality
  shared_preferences: ^2.2.2    # Local caching
  animations: ^2.0.11           # Smooth transitions
  get_it: ^7.6.4                # Dependency injection
  dartz: ^0.10.1                # Functional programming
  shimmer: ^3.0.0               # Loading animations
  intl: ^0.19.0                 # Date formatting
```


### Clean Architecture Layers

1. **Presentation Layer**
   - Screens and widgets
   - UI logic
   - Animation controllers

2. **Domain Layer**
   - Entities (business objects)
   - Use cases (business logic)
   - Repository interfaces

3. **Data Layer**
   - Models (data objects)
   - Repository implementations
   - Data sources (remote/local)

### Design Patterns Used

- **Repository Pattern**: Abstraction over data sources
- **Dependency Injection**: Using GetIt
- **Factory Pattern**: For model creation
- **Singleton Pattern**: For services
- **Observer Pattern**: Ready for BLoC/Cubit

## 👨‍💻 Author

Created with ❤️ by Ahmed Gad