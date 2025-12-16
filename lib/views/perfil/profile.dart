import 'package:chefie/controllers/auth_controller.dart';
import 'package:chefie/theme/app_theme.dart';
import 'package:chefie/views/login/login.dart';
import 'package:chefie/widgets/button.dart';
import 'package:chefie/widgets/chefie_app_bar.dart';
import 'package:chefie/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final user = authState.value;
    Widget profileImage;
    if (user?.photoUrl != null && user!.photoUrl!.isNotEmpty) {
      profileImage = Image.network(
        'https://images.weserv.nl/?url=${Uri.encodeComponent(user.photoUrl!)}',
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          color: Colors.grey[300],
          child: Icon(Icons.person, size: 60, color: Colors.grey[600]),
        ),
      );
    } else {
      profileImage = Container(
        color: Colors.grey[300],
        child: Icon(Icons.person, size: 60, color: Colors.grey[600]),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundOf(context),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ChefieAppBar(title: "Meu Perfil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 3),
                ),
                child: ClipOval(
                  child: profileImage,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            TextTitle(
              text: user?.displayName ?? "Usuário",
              fontSize: 24,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            TextLabel(
              text: user?.email ?? "",
              color: Colors.grey,
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ButtonRounded(
                text: "Sair da conta",
                invertColors: true,
                textColor: AppColors.destructive,
                borderColor: AppColors.destructive,
                onPressed: () async {
                  await ref.read(authControllerProvider.notifier).signOut();
                  
                  if (context.mounted) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                      (route) => false,
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}