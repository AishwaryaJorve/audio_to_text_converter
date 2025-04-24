import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/google_sign_in_service.dart';
import '../screens/auth_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = GoogleSignInService.getCurrentUser();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User Profile Section
              _buildProfileHeader(user),

              const SizedBox(height: 32),

              // Account Settings
              _buildAccountSettings(context),

              const Spacer(),

              // Logout Button
              _buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(User? user) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: user?.photoURL != null 
            ? NetworkImage(user!.photoURL!) 
            : null,
          child: user?.photoURL == null 
            ? Icon(Icons.person, size: 60) 
            : null,
        ),
        const SizedBox(height: 16),
        Text(
          user?.displayName ?? 'User',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          user?.email ?? 'No email',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildAccountSettings(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Account Settings'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Implement account settings
          },
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text('Privacy Policy'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Implement privacy policy
          },
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          await GoogleSignInService.signOut();
          // Navigate to auth screen and remove all previous routes
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const AuthScreen()),
            (Route<dynamic> route) => false,
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Logout failed: $e')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text('Logout'),
    );
  }
}