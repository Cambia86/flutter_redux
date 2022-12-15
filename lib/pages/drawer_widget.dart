
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class drawer_widget extends StatelessWidget {
  const drawer_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('home'),
            onTap: () {
               Navigator.pushNamed(context, '/');
            },
          ),
           ListTile(
            title: const Text('login'),
            onTap: () {
                Navigator.pushNamed(context, '/login');
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('details'),
            onTap: () {
                Navigator.pushNamed(context, '/details');
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}