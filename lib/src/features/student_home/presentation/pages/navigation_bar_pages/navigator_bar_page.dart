import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_identificator/src/features/auth/auth_user/repositories/auth_repository.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/home_page.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/navigation_bar_pages/info_page.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/navigation_bar_pages/settings_page.dart';
import 'package:smart_identificator/src/features/student_home/presentation/widgets/curvednavigationbar.dart';

import '../../../../auth/sign_in/domain/repositories/login_repository.dart';
import 'repositories/info_repository.dart';

class NavigationBarPage extends StatefulWidget {
   NavigationBarPage({super.key, 
   required this.exUserRepository, 
   required this.name, 
   required this.infoRepository,
   required this.uid, });
   final String name;
   final String? uid;
    final ExUserRepository exUserRepository;
    final InfoRepository infoRepository;

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        color:  Colors.orangeAccent,
        animationDuration: const Duration(milliseconds: 300),
        items: const  [
          Icon(Icons.perm_identity),
          Icon(Icons.info),
          Icon(Icons.settings_suggest)
        ],
        index:  _currentIndex,
        onTap: (index){
            setState(() {
              _currentIndex = index;
            });
        },
    ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            HomePage(exUserRepository:widget.exUserRepository, name: widget.name, infoRepository: widget.infoRepository),
            InfoPage(exUserRepository: widget.exUserRepository, infoRepository: widget.infoRepository,),
            SettingsPage(uid: widget.uid,)
          ] ,
        )
        ),
    );
  }
}