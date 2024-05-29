import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:smart_identificator/src/core/config/components/app_colors.dart';
import 'package:smart_identificator/src/features/auth/sign_in/domain/repositories/login_repository.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/home_page.dart';
import 'package:smart_identificator/src/features/student_home/presentation/pages/navigation_bar_pages/repositories/info_repository.dart';
import 'package:smart_identificator/src/features/student_home/presentation/widgets/front_card.dart';




class InfoPage extends StatefulWidget {
  final ExUserRepository exUserRepository;
  final InfoRepository infoRepository;
  const InfoPage({super.key, 
  required this.exUserRepository, 
  required this.infoRepository});

  @override
  State<InfoPage> createState() => _InfoPageState();

  static String selectedGroup = '0';
   static String selectedCourse = '0';
   static String selectedSpec = '0';

   static String name = '';
   static String surname = '';
   static String teacher  = '';
   static String phoneNumber = '';
   static String facebook = '';
   static String instagram = '';
   static String telegram = '';

}

class _InfoPageState extends State<InfoPage> {

  String name = '';

  
   String startSpecValue = '0';
   String startCourseValue = '0';
   String startGroupValue = '0';

    TextEditingController nameController = TextEditingController();
    TextEditingController surnameController = TextEditingController();
    TextEditingController teacherController = TextEditingController();
    TextEditingController numberPhoneController = TextEditingController();
    TextEditingController telegramController = TextEditingController();
    TextEditingController instagramController = TextEditingController();
    TextEditingController fbookController = TextEditingController();

    final formInfoKey = GlobalKey<FormState>();
  
    final maskFormatter =  MaskTextInputFormatter(mask: '### ## ### ####');
    final TextEditingController phoneController = TextEditingController();

                      void errorValidation(){
                      if(InfoPage.selectedGroup == startGroupValue){
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Помилка', style: TextStyle(fontSize: 18),),
                          content: Text('Будь ласка, оберіть cвою групу'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK', style: TextStyle(color: colorBlack),),
                            ),
                          ],
                        );
                      },
                    );
                    } else if(InfoPage.selectedCourse == startCourseValue){
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Помилка', style: TextStyle(),),
                          content: Text('Будь ласка, оберіть cвій курс'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    } else if(InfoPage.selectedSpec == startSpecValue){
                      showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Помилка', style: TextStyle(),),
                          content: Text('Будь ласка, оберіть cвою спеціальність'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    }
    }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return  Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formInfoKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: screenWidth / 18, top: screenHeight / 50),
                    child: Text('Заповніть інформацію про себе ', style:  GoogleFonts.montserrat(fontSize: 27, fontWeight: FontWeight.w800, color: colorBlack)),
                  ),
                  SizedBox(height: screenHeight / 300),
                      SizedBox(
                    width: screenWidth * 0.9,//screenWidth / 3,
                    child: TextFormField(

                      onChanged: (nameField){
                        nameField = nameController.text;
                        InfoPage.name = nameField;
                      },
                      style:  GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      validator: (name) {
               if (name!.isEmpty) {
                    return 'Поле не може бути пустим';
                  } else if (name.contains(RegExp(r'[0-9]')) || name.contains(RegExp(r'[a-zA-Z ]')) || name.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                    return 'Це поле не може містити цифри, англ. букви і спец.симв';
                  }
               return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Ім`я',
              hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 120),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      onChanged: (surnameField){
                        surnameField =  surnameController.text;
                        InfoPage.surname = surnameField;
                      },
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      validator: (surname) {
              if (surname!.isEmpty) {
                    return 'Поле не може бути пустим';
                  } else if (surname.contains(RegExp(r'[0-9]')) || surname.contains(RegExp(r'[a-zA-Z ]')) || surname.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                    return 'Це поле не може містити цифри, англ. букви і спец.симв';
                  }
               return null;
                      },
                      controller: surnameController,
                      decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Прізвище',
              hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 100),
              
                  SizedBox(
                    height: screenHeight / 17,
                    width: screenWidth * 0.9,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('groups').snapshots(), 
                      builder: (context, snapshot){
                        List<DropdownMenuItem> groupItems = [];
                        if(!snapshot.hasData){
                          CircularProgressIndicator();
                        }else{
                          final groups = snapshot.data?.docs.reversed.toList();
                          groupItems.add(
                            DropdownMenuItem(
                              value: startGroupValue,
                              child: Text('Оберіть свою групу', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600))
                                )
                              );
                          for(var group in groups!){
                            groupItems.add(
                              DropdownMenuItem(
                                value: group.id,
                                child: Text(group['group'], style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),)
                                )
                                );
                          }
                        }
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth/30),
                            child: DropdownButton(
                              underline: Container(),
                              items: groupItems, 
                              onChanged: (groupValue){
                                setState(() {
                                  InfoPage.selectedGroup = groupValue!;
                                });
                                print(groupValue);
                              },
                              value: InfoPage.selectedGroup,
                              isExpanded: false,
                              ),
                          ),
                        );
                      })
              ),
                  SizedBox(height: screenHeight / 120),
                  SizedBox(
                    height: screenHeight / 17,
                    width: screenWidth * 0.9,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('courses').snapshots(), 
                      builder: (context, snapshot){
                        List<DropdownMenuItem> courseItems = [];
                        if(!snapshot.hasData){
                          CircularProgressIndicator();
                        }else{
                          final courses = snapshot.data?.docs.reversed.toList();
                          courseItems.add(
                            DropdownMenuItem(
                              value: startCourseValue,
                              child: Text('Оберіть свій курс', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600))
                                )
                              );
                          for(var course in courses!){
                            courseItems.add(
                              DropdownMenuItem(
                                value: course.id,
                                child: Text(course['course'], style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),)
                                )
                                );
                          }
                        }
                        return Container(
                         width: screenWidth / 3,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth/30),
                            child: DropdownButton(    
                              underline: Container(),
                              items: courseItems, 
                              onChanged: (courseValue){
                                setState(() {
                                  InfoPage.selectedCourse = courseValue!;
                                });
                                print(courseValue);
                              },
                              value: InfoPage.selectedCourse,
                              isExpanded: false,
                            
                              ),
                          ),
                        );
                      })
              ),
                  SizedBox(height: screenHeight / 120),
                   SizedBox(
                    height: screenHeight / 17,
                    width: screenWidth * 0.9,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('specialization').snapshots(), 
                      builder: (context, snapshot){
                        List<DropdownMenuItem<String>> specItems = [];
                        if(!snapshot.hasData){
                          CircularProgressIndicator();
                        }else{
                          final specializ = snapshot.data?.docs.reversed.toList();
                          specItems.add(
                            DropdownMenuItem(
                              value: startSpecValue,
                              child: Text('Оберіть свою спеціальність', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600))
                                )
                              );
                          for(var spec in specializ!){
                            specItems.add(
                              DropdownMenuItem(
                      
                                value: spec.id,
                                child: Text(spec['specialization'], style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),)
                                )
                                );
                          }
                        }
                        return Container(
                        
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth/30),
                            child: DropdownButtonFormField<String>(   
                              decoration: InputDecoration(
                                border: InputBorder.none
                              ),                        
                              items: specItems, 
                              onChanged: (specValue){
                                setState(() {
                                  InfoPage.selectedSpec = specValue!;
                                });
                                print(InfoPage.selectedSpec);
                              },
                              value: InfoPage.selectedSpec,
                              isExpanded: false,
                              ),
                          ),
                        );
                      })             
                  ),
                   SizedBox(height: screenHeight / 100),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      onChanged: (teacherField){
                          teacherField = teacherController.text;
                          InfoPage.teacher = teacherField;
                      },
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      validator: (teacher) {
              if (teacher!.isEmpty) {
                    return 'Поле не може бути пустим';
                  } else if (teacher.contains(RegExp(r'[0-9]')) || teacher.contains(RegExp(r'[a-zA-Z ]')) || teacher.contains(RegExp(r'[!@#$%^&*(),?":{}|<>]'))) {
                    return 'Це поле не може містити цифри, англ. букви і спец.симв';
                  }
               return null;
                      },
                      controller: teacherController,
                      decoration: InputDecoration(
                        helperText: 'Наприклад - Прокопів Р.В',
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Введіть куратора вашої групи',
              hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                      ),
                    ),
                  ),
                   SizedBox(height: screenHeight / 100),
                    SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      onChanged: (phoneField){
                          phoneField = numberPhoneController.text.trim();
                          InfoPage.phoneNumber = phoneField;
                      },
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [maskFormatter],
                      controller: numberPhoneController,
                      decoration: InputDecoration(
                        prefixText: '+ ',
                        prefixStyle: TextStyle(color: colorBlack),
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Введіть ваш номер телефону',
              hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                      ),
                    ),
                  ),
                    SizedBox(height: screenHeight / 60),
                    Padding(
                      padding:  EdgeInsets.only(right: screenWidth / 3),
                      child: Text('Cоціальні мережі ', style:  GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w800, color: colorBlack)),
                    ),
                    SizedBox(height: screenHeight / 600),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      onChanged: (tg){
                            tg = telegramController.text;
                            InfoPage.telegram = tg;
                      },
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      controller: telegramController,
                      decoration: InputDecoration(
                        prefixText: '@ ',
                        prefixStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              contentPadding: const EdgeInsets.all(15),
              helperText: 'Якщо немає акаунту або не бажаєте вводити, залишіть -',
              hintText: 'Telegram',
              hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 100),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      onChanged: (insta){
                          insta = instagramController.text;
                          InfoPage.instagram = insta;
                      },
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      controller: instagramController,
                      decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Instagram',
              helperText: 'Якщо немає акаунту або не бажаєте вводити, залишіть -',
              hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 100),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      onChanged: (fb){
                          fb = fbookController.text;
                          InfoPage.facebook = fb;
                      },
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      controller: fbookController,
                      decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Facebook',
              helperText: 'Якщо немає акаунту або не бажаєте вводити, залишіть -',
              hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 120),
                     SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight / 20,
                      child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
              ),
              onPressed: (){
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(exUserRepository: widget.exUserRepository, name: name, infoRepository: widget.infoRepository,)));
                if(formInfoKey.currentState!.validate()) {
                  errorValidation();
                  widget.infoRepository.saveInfoForStudent();
                  Text('${nameController.text}');
                  Text('${surnameController.text}');
            }
              }, 
                      child: Text('Зберегти', style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, color: colorWhite, fontSize: 19), )
                      )
                ),
                SizedBox(height: screenHeight / 80),
                ] ,
              ),
            ),
          )
        ),
    );
  }
}

