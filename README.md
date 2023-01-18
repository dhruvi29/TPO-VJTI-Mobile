# TPO VJTI Mobile App
* You can find the corresponding web app [here](https://github.com/PranitRohokale/TPO-Code_miners)
* App:
    * Student Interface
* Web: 
    * Admin Interface
    * Recruiter Interface

# Installation    
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