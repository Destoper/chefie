// lib/services/auth_service.dart
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_profile.dart';
import '../config/env.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  
  // armengue para o GoogleSignIn funcionar tanto na web quanto no mobile
  final GoogleSignIn? _googleSignIn = kIsWeb ? null : GoogleSignIn(
    serverClientId: Env.authGoogleClientId,
  );
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
      if (kIsWeb) {
        await _supabase.auth.signInWithOAuth(
          OAuthProvider.google,
        );
        return null;
        
      } else {
        // MOBILE
        final googleUser = await _googleSignIn!.signIn();
        if (googleUser == null) return null;

        final googleAuth = await googleUser.authentication;
        final accessToken = googleAuth.accessToken;
        final idToken = googleAuth.idToken;

        if (accessToken == null || idToken == null) {
          throw Exception('Erro ao obter tokens do Google (Mobile)');
        }

        final response = await _supabase.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken,
        );

        if (response.user == null) {
          throw Exception('Erro ao autenticar no Supabase (Mobile)');
        }
        return userProfile;
      }
    } catch (e) {
      rethrow;
    }
  }

  // Logout
  Future<void> signOut() async {
    try {
      if (!kIsWeb) {
        await _googleSignIn!.signOut();
      }
      await _supabase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}