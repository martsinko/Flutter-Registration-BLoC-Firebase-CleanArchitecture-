import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../auth/sign_in/domain/repositories/login_repository.dart';
import '../../../auth/sign_in/presentation/bloc/sign_in_bloc.dart';

class BackCardWidget extends StatelessWidget {
  const BackCardWidget({
    super.key,
    required this.context,
    required this.title,
    required this.loginFirebase,
    required this.exUserRepository,
  });

  final BuildContext context;
  final String title;
  final FirebaseAuth loginFirebase;
  final ExUserRepository exUserRepository;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(exUserRepository: exUserRepository),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 5,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.black, width: 1.1),
          ),
          height: screenHeight * 0.58,
          width: screenWidth * 0.93,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('students')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isNotEmpty) {
                  DocumentSnapshot studentData = snapshot.data!.docs.first;
                  String name = studentData['name'];
                  String surname = studentData['surname'];
                  String specialnist = studentData['spec'];

                  return Column(
                    children: [
                      SizedBox(height: screenHeight / 22),
                      QrImageView(
                        data: '$name $surname Кваліфікація',
                        version: QrVersions.auto,
                        size: 330,
                      ),
                      SizedBox(height: screenHeight / 65),
                      Text(
                        'QR Код',
                        style: GoogleFonts.montserrat(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text('Немає даних для цього студента'));
                }
              } else if (snapshot.hasError) {
                return Center(child: Text('Помилка завантаження даних: ${snapshot.error}'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
