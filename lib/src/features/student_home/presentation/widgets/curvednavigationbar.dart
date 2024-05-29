
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavigationBarWidget extends StatelessWidget {
  const CurvedNavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        color:  Colors.orangeAccent,
        animationDuration: const Duration(milliseconds: 300),
        items: const  [
          Icon(Icons.perm_identity),
          Icon(Icons.info),
          Icon(Icons.dark_mode)
        ],
        
    );
  }
}
