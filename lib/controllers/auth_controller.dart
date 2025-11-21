import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_profile.dart';
import '../services/auth_service.dart';

part 'auth_controller.g.dart';

@riverpod
AuthService authService(Ref ref) {
  return AuthService();
}

@riverpod
Stream<User?> authStateChanges(Ref ref) {
  return Supabase.instance.client.auth.onAuthStateChange
      .map((event) => event.session?.user);
}

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<UserProfile?> build() {
    ref.listen(authStateChangesProvider, (_, next) {
      state = AsyncValue.data(ref.read(authServiceProvider).userProfile);
    });

    final authService = ref.watch(authServiceProvider);
    return AsyncValue.data(authService.userProfile);
  }

  AuthService get _authService => ref.read(authServiceProvider);

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _authService.signInWithGoogle();
    });
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }

  bool get isAuthenticated => _authService.isAuthenticated;

  String? get currentUserId => _authService.currentUser?.id;
}