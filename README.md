# TPO VJTI Mobile App

lib > constants > supabase_keys.dart
``` dart
abstract class SupabaseConstants {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://wcuxprabdbhvzollnbig.supabase.co',
  );

  static const String supabaseAnnonKey = String.fromEnvironment(
    'SUPABASE_ANNON_KEY',
    defaultValue: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndjdXhwcmFiZGJodnpvbGxuYmlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzM1MDQzMTksImV4cCI6MTk4OTA4MDMxOX0.EmAexP2N21D0SuusipypvkU_n11cc_W3VuNqOS6ccro',
  );
}
```