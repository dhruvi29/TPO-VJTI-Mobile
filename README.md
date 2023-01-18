# TPO VJTI Mobile App

lib > constants > supabase_keys.dart
``` dart
abstract class SupabaseConstants {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );

  static const String supabaseAnnonKey = String.fromEnvironment(
    'SUPABASE_ANNON_KEY',
    defaultValue: '',
  );
}
```

Define the variables when you run the app as follows:
```
flutter run lib/main.dart --dart-define=SUPABASE_URL=url --dart-define=SUPABASE_ANNON_KEY=key
```