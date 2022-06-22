import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../utils/common/validation.dart';
import '../widgets/textfield.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductState();
}

class _AddProductState extends State<AddProductScreen> {
  final AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Offset position = const Offset(0.0, 0.0);
  final AssetImage _imageToShow =  const AssetImage('assets/images/apple.png');
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        height: screenSize.height,
        width: screenSize.width,
        decoration: const BoxDecoration(
           //image: DecorationImage(image: AssetImage("assets/images/bg.png",),fit: BoxFit.cover),
         color: Color(0xFF1d202b),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child : Padding(
          padding: const EdgeInsets.only(top:32.0),
          child: Container(
            padding: const EdgeInsets.only(left: 18.0,right: 18.0),
            margin: const EdgeInsets.all(16.0),
            height: screenSize.height * 0.82,
            width: screenSize.width * 0.87,
            decoration: const BoxDecoration(
              //image: DecorationImage(image: AssetImage("assets/images/bg.png",),fit: BoxFit.cover),
              color: Color(0xFF434454),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _closeButton(context,screenSize),
               const SizedBox(
                 height: 10,
               ),
                _stepper(context,screenSize),
                const SizedBox(
                  height: 10,
                ),

                _productDetails(context,screenSize),

              ],
            ),
    ),
        ));
  }
Widget _productDetails(BuildContext context,Size screenSize){
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          _productName(),
          const SizedBox(
            height: 10,
          ),
          _enterProductName(screenSize),
          const SizedBox(
            height: 10,
          ),
          _detailsName(),
          const SizedBox(
            height: 10,
          ),
          _enterDetails(screenSize),
          const SizedBox(
            height: 10,
          ),
          _iconName(),
          const SizedBox(
            height: 10,
          ),
          _iconDetails(screenSize),
        ],
      ),
    );
}
Widget _enterProductName(Size size){
  return Container(
    padding: const EdgeInsets.all(8.0),
    height: size.height / 13.5,
    width: size.width * 2,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    child: const DefaultTextStyle(
      style:  TextStyle(color: Colors.grey,
        fontSize: 16.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('2 Weeks athletics plan',
          ),
      ),
    ),
  );
  }
Widget _iconDetails(Size size){
  return Container(
    padding: const EdgeInsets.all(8.0),
    height: size.height / 3.5,
    width: size.width * 6,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),

    child: Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 190,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Material(
                        color: const Color(0xFF1d202b), // Button color
                        child: InkWell(
                          splashColor: Colors.amberAccent, // Splash color
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:  Container(width: 35, height: 35,
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/barbell.png",),fit: BoxFit.cover),
                              //color: Color(0xFF434454),
                              //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),

                          ),
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: const Color(0xFF1d202b), // Button color
                        child: InkWell(
                          splashColor: Colors.amberAccent, // Splash color
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:  Container(width: 35, height: 35,
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/exercise.png",),fit: BoxFit.cover),
                              //color: Color(0xFF434454),
                              //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),

                          ),
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: const Color(0xFF1d202b), // Button color
                        child: InkWell(
                          splashColor: Colors.amberAccent, // Splash color
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:  Container(width: 35, height: 35,
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/fitness.png",),fit: BoxFit.cover),
                              //color: Color(0xFF434454),
                              //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),

                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    ClipOval(
                      child: Material(
                        color: const Color(0xFF1d202b), // Button color
                        child: InkWell(
                          splashColor: Colors.amberAccent, // Splash color
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:  Container(width: 30, height: 30,
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/barbell.png",),fit: BoxFit.cover),
                              //color: Color(0xFF434454),
                              //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),

                          ),
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: const Color(0xFF1d202b), // Button color
                        child: InkWell(
                          splashColor: Colors.amberAccent, // Splash color
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const SizedBox(width: 20, height: 20,child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.close,size: 15,),
                          )),
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: const Color(0xFF1d202b), // Button color
                        child: InkWell(
                          splashColor: Colors.amberAccent, // Splash color
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const SizedBox(width: 20, height: 20,child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.close,size: 15,),
                          )),
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    ClipOval(
                      child: Material(
                        color: const Color(0xFF1d202b), // Button color
                        child: InkWell(
                          splashColor: Colors.amberAccent, // Splash color
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:  Container(width: 30, height: 30,
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/barbell.png",),fit: BoxFit.cover),
                              //color: Color(0xFF434454),
                              //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),

                          ),
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: const Color(0xFF1d202b), // Button color
                        child: InkWell(
                          splashColor: Colors.amberAccent, // Splash color
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const SizedBox(width: 20, height: 20,child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.close,size: 15,),
                          )),
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: const Color(0xFF1d202b), // Button color
                        child: InkWell(
                          splashColor: Colors.amberAccent, // Splash color
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const SizedBox(width: 20, height: 20,child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.close,size: 15,),
                          )),
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ],
    ),
  );
  }
Widget _enterDetails(Size size){
  return Container(
    padding: const EdgeInsets.all(8.0),
    height: size.height / 6,
    width: size.width * 2,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.all(const Radius.circular(10.0)),
    ),
    child: const DefaultTextStyle(
      style:  TextStyle(color: Colors.grey,
        fontSize: 16.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Enter text...',
          ),
      ),
    ),
  );
  }
Widget _productName() {
  return const Align(
    alignment: Alignment.topLeft,
    child: DefaultTextStyle(
      style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.0),
      child: Text('PRODUCT NAME'),
    ),
  );
}
Widget _detailsName() {
  return const Align(
    alignment: Alignment.topLeft,
    child: DefaultTextStyle(
      style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.0),
      child: Text('ENTER DETAILS'),
    ),
  );
}
Widget _iconName() {
  return const Align(
    alignment: Alignment.topLeft,
    child: DefaultTextStyle(
      style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16.0),
      child: Text('CHOOSE ICON'),
    ),
  );
}
  Widget _stepper(BuildContext context,Size screenSize) {
    return const Padding(
                padding: EdgeInsets.only(left: 26.0,right: 26.0,top: 8.0,bottom: 8.0),
                child: StepProgressIndicator(
                  totalSteps: 4,
                  padding: 4,
                  currentStep: 1,
                  size: 6,
                  selectedColor: Colors.amberAccent,
                  unselectedColor: Colors.grey,

                ),
              );
  }

  Widget _closeButton(BuildContext context,Size screenSize) {
    return Padding(
                padding: const EdgeInsets.only(right: 6.0,top: 12.0,),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ClipOval(
                    child: Material(
                      color: const Color(0xFF1d202b), // Button color
                      child: InkWell(
                        splashColor: Colors.amberAccent, // Splash color
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const SizedBox(width: 20, height: 20,child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(Icons.close,size: 15,),
                        )),
                      ),
                    ),
                  ),
                ),
              );
  }
}
