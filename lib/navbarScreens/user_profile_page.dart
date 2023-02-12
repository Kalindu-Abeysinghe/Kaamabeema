import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'User profile',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
