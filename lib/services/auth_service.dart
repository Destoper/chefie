import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_profile.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  
  User? get currentUser => _supabase.auth.currentUser;

  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  bool get isAuthenticated => currentUser != null;

  UserProfile? get userProfile {
    final user = currentUser;
    if (user == null) return null;

    return UserProfile(
      id: user.id,
      email: user.email ?? '',
      displayName: user.userMetadata?['full_name'] ?? user.email?.split('@')[0],
      photoUrl: user.userMetadata?['avatar_url'],
    );
  }

  Future<UserProfile?> signInWithGoogle() async {
    try {
      final response = await _supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: kIsWeb 
          ? null 
          : 'io.supabase.chefie://login-callback/',
        authScreenLaunchMode: LaunchMode.externalApplication,
      );

      if (!response) {
        throw Exception('Failed to initiate Google Sign-In');
      }

      return userProfile;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}