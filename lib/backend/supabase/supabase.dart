import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://stwxkdfdiphibyfenzya.supabase.co';
const _kSupabaseAnonKey ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN0d3hrZGZkaXBoaWJ5ZmVuenlhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA2MDM1NzMsImV4cCI6MjA1NjE3OTU3M30.NWVUCUQBUK8qxaccybPfsU7sRHNR5NzYiEll8Gct8bg';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
