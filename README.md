# Vodafone UI Clone

A Flutter mobile app interface inspired by the Vodafone Cash application, featuring modern UI design, smooth animations, and clean architecture.


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
├── core/                           # Shared app-wide resources
│   ├── base_usecase.dart          # Base class for all use cases
│   ├── theme/                     # App theming
│   │   ├── app_colors.dart        # Color palette
│   │   ├── app_dimensions.dart    # Spacing & sizing
│   │   ├── app_text_styles.dart   # Typography
│   │   └── app_theme.dart         # Theme configuration
│   ├── constants/                 # App-wide constants
│   │   ├── app_strings.dart       # Text constants
│   │   └── assets.dart            # Asset paths
│   ├── routes/                    # Navigation
│   │   ├── app_routes.dart        # Route names
│   │   └── route_generator.dart   # Route configuration
│   ├── utils/                     # Utilities
│   │   ├── cache_helper.dart      # SharedPreferences wrapper
│   │   └── helpers.dart           # Helper functions
│   ├── widgets/                   # Reusable widgets
│   │   ├── animated_fade_in.dart
│   │   ├── animated_slide_in.dart
│   │   └── shimmer_loading.dart
│   ├── mock_data/                 # Mock data for development
│   │   └── mock_data.dart
│   └── di/                        # Dependency injection
│       └── injection_container.dart
│
├── features/                       # Feature modules (Clean Architecture)
│   ├── home/
│   │   ├── data/
│   │   │   ├── datasources/       # Data sources (remote/local)
│   │   │   │   ├── home_remote_data_source.dart
│   │   │   │   └── home_local_data_source.dart
│   │   │   ├── models/            # Data models (JSON serialization)
│   │   │   │   ├── balance_model.dart
│   │   │   │   ├── service_card_model.dart
│   │   │   │   ├── service_model.dart
│   │   │   │   └── promotion_model.dart
│   │   │   └── repositories/      # Repository implementations
│   │   │       └── home_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/          # Business entities
│   │   │   │   ├── balance_entity.dart
│   │   │   │   ├── service_entity.dart
│   │   │   │   └── promotion_entity.dart
│   │   │   ├── repositories/      # Repository interfaces
│   │   │   │   └── home_repository.dart
│   │   │   └── usecases/          # Business logic
│   │   │       ├── get_balance_usecase.dart
│   │   │       ├── get_service_cards_usecase.dart
│   │   │       ├── get_services_usecase.dart
│   │   │       └── get_promotions_usecase.dart
│   │   └── presentation/
│   │       ├── screens/           # Screen widgets
│   │       │   └── home_screen.dart
│   │       ├── components/        # UI components
│   │       │   ├── custom_home_app_bar.dart
│   │       │   ├── home_screen_content.dart
│   │       │   ├── service_grid/
│   │       │   ├── service_cards_carousel/
│   │       │   └── promotional_card_with_indicator/
│   │       └── controller/        # State management (Cubit)
│   │           ├── home_cubit.dart
│   │           └── home_state.dart
│   │
│   ├── offers/                    # Offers feature (same structure)
│   ├── messages/                  # Messages/Notifications feature
│   ├── profile/                   # Profile management feature
│   ├── more/                      # Additional services feature
│   └── main_wrapper.dart          # Main navigation wrapper
│
├── main.dart                      # App entry point
└── vodafone_app.dart              # App widget configuration
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

### Strategy (Remote-First with Cache Fallback)
1. **Fetch from remote**: Always attempt to fetch fresh data from remote data source first
2. **Cache on success**: If remote fetch succeeds, immediately cache the data
   - Balance data (`BalanceModel`)
   - Service cards (`List<ServiceCardModel>`)
   - Services (`List<ServiceModel>`)
   - Promotions (`List<PromotionModel>`)
3. **Fallback to cache**: If remote fetch fails, return cached data if available
4. **Error handling**: Only return error if both remote fetch and cache retrieval fail
5. **Cache invalidation**: Clear all home-related cache when needed via `clearCache()`

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
