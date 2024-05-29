import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_identificator/src/features/auth/sign_in/presentation/pages/sing_in_page.dart';
import 'package:smart_identificator/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';

import '../../../../core/config/components/app_config.dart';
import '../../../auth/sign_up/presentation/widgets/sign_up_widgets.dart';

class FrontCardWidget extends StatefulWidget {
  final String? uid;
  final String name;
  const FrontCardWidget({super.key, required this.name, required this.uid});

  @override
  State<FrontCardWidget> createState() => _FrontCardWidgetState();
}

class _FrontCardWidgetState extends State<FrontCardWidget> {
  File? selectedImage;

  Future _pickImageFromGallery() async {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: screenHeight * 0.21,
        maxWidth: screenWidth * 0.48);
    if (image == null) return;
    setState(() {
      selectedImage = (File(image.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DocumentSnapshot studentData = snapshot.data!.docs.first;
            // Use the google email if it exists, otherwise fallback to normal email
            String emailStudent = studentData['email'];
            String special = studentData['spec'];
            String groupa = studentData['group'];
            String kyrs = studentData['course'];
            String nameStudent = studentData['name'];
            String surnameStudent = studentData['surname'];
            String kyrator = studentData['teacher'];
            String phone = studentData['numberPhone'];
            String instag = studentData['instagram'];
            String faceb = studentData['facebook'];
            String teleg = studentData['telegram'];

            return Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 5,
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.1),
                    borderRadius: BorderRadius.circular(25)),
                height: screenHeight * 0.6,
                width: screenWidth * 0.93,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight / 180, left: screenWidth / 120.0),
                          child: Image(
                              height: screenHeight * 0.13,
                              width: screenWidth * 0.3,
                              image: AssetImage(photo2)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: screenWidth / 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                city,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                address,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                number,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                poshta,
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 0.6),
                              gradient: gradient),
                          height: screenHeight / 5.5,
                          width: screenWidth * 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: screenWidth / 50.0, top: screenHeight / 200.0), //4
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${nameStudent} ${surnameStudent}',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w800, fontSize: 18),
                                  ),
                                  Text(
                                    spec,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w800, fontSize: 15),
                                  ),
                                  Text(
                                    special,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600, fontSize: 13),
                                  ),
                                  Text(
                                    tutor,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w800, fontSize: 15),
                                  ),
                                  Text(
                                    'Мельник Ю. Б',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600, fontSize: 15),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        group,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w800, fontSize: 15),
                                      ),
                                      Text(
                                        ' $groupa',
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w600, fontSize: 15),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: screenHeight / 3.9,
                          child: GestureDetector(
                            onTap: () {
                              _pickImageFromGallery();
                            },
                            child: SizedBox(
                                width: screenWidth * 0.48,
                                height: screenHeight * 0.21,
                                child: selectedImage != null
                                    ? Image.file(selectedImage!)
                                    : Image.asset(photo)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight / 112),
                    Text(
                      kurs,
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      kyrs,
                      style: GoogleFonts.montserrat(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: screenHeight / 121), //7),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                      height: 0.4,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth / 50.0, top: screenHeight / 120.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(phIdNumber,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w800, fontSize: 15)),
                              Text(' + ${phone}',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600, fontSize: 15))
                            ],
                          ),
                          SizedBox(height: screenHeight / 200),
                          Text(idEmail,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w800, fontSize: 15)),
                          Text('${emailStudent}',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600, fontSize: 15)),
                          SizedBox(height: screenHeight / 300),
                          Text(social,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w800, fontSize: 15)),
                          Text('$inst ${instag}',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic)),
                          Text('$tg ${teleg}',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic)),
                          Text('Facebook: ${faceb}',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Помилка завантаження даних: ${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
