import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';

import '../../../../../core/config/components/app_config.dart';
import '../../../../auth/sign_in/presentation/bloc/sign_in_bloc.dart';

class SettingsPage extends StatelessWidget {
   final String? uid;
  const SettingsPage({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: screenWidth / 22, top: screenHeight / 20),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('students').snapshots(), 
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    DocumentSnapshot studentData = snapshot.data!.docs.first;
                    String studentName = studentData['name'];
                    String studentSurname = studentData['surname'];
                    String studentEmail = studentData['email'];
                    return Center(
                      child: Column(
                        children: [
                          Text('$studentName $studentSurname', style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700, color: colorCustomBlack,),),
                          Text(studentEmail, style: GoogleFonts.montserrat(fontSize: 17, fontWeight: FontWeight.w700, color: colorCustomBlack,)),
                          
                        ],
                      ),
                    );
                  } else if(snapshot.hasError){
                        return Text('Помилка завантаження даних: ${snapshot.error}');
                    } else {
                    return Center(child: CircularProgressIndicator());
                      }
                }
                ),
            ),
            SizedBox(height: screenHeight / 20),
              TextButton(
                onPressed: (){}, 
                child: Text('Правила та використання', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.orangeAccent,))
                ),
                Row(
                  children: [
                    TextButton(
                    onPressed: (){
                      BlocProvider.of<SignInBloc>(context)
                              .add(SignOutButtonPressed());
                    }, 
                    child: Text('Вийти', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.orangeAccent,))
                    ),
                    Icon(Icons.exit_to_app_outlined, color: Colors.orangeAccent,)
                  ],
                )
          ] ,
        ) 
        ),
    );
  }
}