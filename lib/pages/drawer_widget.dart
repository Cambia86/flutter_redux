
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class drawer_widget extends StatelessWidget {
  const drawer_widget(this.showArrow,{
    Key? key,
  }) : super(key: key);

   final bool showArrow;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: 
   
      ListView(
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
            title: const Text('championship'),
            onTap: () {
                Navigator.pushNamed(context, '/championship');
              // Update the state of the app.
              // ...
            },
          ),
          
        ],
      )
    );
  }
}