import 'package:flutter/material.dart';
import 'package:sarah/screens/navbarScreens/diet_preferences/diet_preferences_one.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
          'User profile',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        ElevatedButton(
            onPressed: (() => Navigator.of(context).pushNamed(DietPreferencesOne.route)),
            child: const Text('Go to Diet preferences'))
      ]),
    );
  }
}
