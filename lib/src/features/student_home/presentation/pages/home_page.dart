import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_identificator/src/features/auth/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:smart_identificator/src/features/auth/sign_in/presentation/pages/sing_in_page.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/navigation_bar_pages/info_page.dart';
import 'package:smart_identificator/src/features/welcome_page/presentation/pages/welcome_page.dart';
import '../../../../core/config/components/app_config.dart';
import '../../../auth/auth_user/repositories/auth_repository.dart';
import '../../../auth/sign_in/domain/repositories/login_repository.dart';
import '../widgets/back_card.dart';
import '../widgets/curvednavigationbar.dart';
import '../widgets/front_card.dart';
import 'navigation_bar_pages/repositories/info_repository.dart';

class HomePage extends StatefulWidget {
  final String? uid;
  final String name;
  const HomePage({super.key, 
  required this.exUserRepository, 
  required this.name,
  required this.infoRepository, this.uid, });
  final InfoRepository infoRepository;
  final ExUserRepository exUserRepository;

  @override
  State<HomePage> createState() => _HomePageState();
}

int _currentIndex = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(exUserRepository: widget.exUserRepository),
      child: Scaffold(
       /* bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        color:  Colors.orangeAccent,
        animationDuration: const Duration(milliseconds: 300),
        items: const  [
          Icon(Icons.perm_identity),
          Icon(Icons.info),
          Icon(Icons.dark_mode)
        ],
        index:  _currentIndex,
        onTap: (index){
            setState(() {
              _currentIndex = index;
            });
        },

    ),*/
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorWhite,
          toolbarHeight: screenHeight / 6,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight / 72),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth / 24),
                        child: Image(
                            height: screenHeight * 0.12,
                            image: const AssetImage(photo2)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenHeight / 34),
                        child: Text(
                          subtitle,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        body: SafeArea(
          child: IndexedStack(
            index: _currentIndex,
            children: [
              Padding(
              padding: EdgeInsets.only(top: screenHeight / 30),
              child: Center(
                child: Column(
                  children: [
                    FlipCard(
                        front: FrontCardWidget(name: widget.name, uid: widget.uid,),
                        back: BackCardWidget(
                            context: context,
                            title: 'Back Side',
                            loginFirebase: firebaseAuth,
                            exUserRepository: widget.exUserRepository))
                  ],
                ),
              ),
            ),
            InfoPage(exUserRepository: widget.exUserRepository, infoRepository: widget.infoRepository,),
            WelcomePage()
          ]
        ),  
      ),
    ),
  );
}
}
