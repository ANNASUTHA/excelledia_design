import 'package:dotted_border/dotted_border.dart';
import 'package:draggable_widget/draggable_widget.dart';
import 'package:excelledia_design/view/pages/add_price_page.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../utils/common/validation.dart';
import '../widgets/buttonWidget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductState();
}

class _AddProductState extends State<AddProductScreen> {
  late final Widget child;
  final AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _targetImageUrl ="assets/images/running.png";
  final dragController = DragController();
  Offset position = const Offset(100, 100);
  double prevScale = 1;
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: screenSize.height,
            width: screenSize.width,
            decoration: const BoxDecoration(
              //image: DecorationImage(image: AssetImage("assets/images/bg.png",),fit: BoxFit.cover),
              color: Color(0xFF1d202b),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Container(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                margin: const EdgeInsets.all(16.0),
                height: screenSize.height,
                width: screenSize.width * 0.87,
                decoration: const BoxDecoration(
                  //image: DecorationImage(image: AssetImage("assets/images/bg.png",),fit: BoxFit.cover),
                  color: Color(0xFF434454),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _closeButton(context, screenSize),
                  const SizedBox(
                    height: 10,
                  ),
                  _textView(),
                  const SizedBox(
                    height: 10,
                  ),
                  _stepper(context, screenSize),
                  const SizedBox(
                    height: 10,
                  ),
                  _productDetails(context, screenSize),
                ],
                  ),
              ),
            )),
      ),
    );
  }
  Widget _textView(){
    return Text( "ADD PRODUCT",style:
    Theme.of(context)
        .textTheme
        .headline6
    !.copyWith(color: Colors.white),

    );
  }
  Widget _productDetails(BuildContext context, Size screenSize) {
    return Form(
      key: _formKey,
      child: Column(
        /* mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,*/
        children: [
          _productName(),
          const SizedBox(
            height: 10,
          ),
          _enterProductName(screenSize),
          const SizedBox(
            height: 10,
          ),

          _enterDetailsText(),
          const SizedBox(
            height: 10,
          ),
          _enterDetails(screenSize),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          _iconName(),
          const SizedBox(
            height: 10,
          ),
          _iconDetails(screenSize),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            title: "NEXT",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddPriceScreen()),
              );

            },
          ),


        ],
      ),
    );
  }

  Widget _enterProductName(Size size) {
    return TextFormField(
      controller: _productNameController,
      autovalidateMode: _autoValidateMode,
      cursorColor:
      Colors.amberAccent,
      decoration: InputDecoration(
        hintText: '2 Weeks athletics plan',
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color:
            Colors.grey,
          ),
          borderRadius:
          BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: TextInputType.name,
      validator: SimpleFunctions.nameValidator,
    );

  }

  Widget _iconDetails(Size size) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: size.height / 3.9,
      width: size.width * 6,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 190,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Draggable<String>(
                        data: "assets/images/barbell.png",
                        child: Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/barbell.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Material(
                              color: const Color(0xFF1d202b), // Button color
                              child: InkWell(
                                splashColor: Colors.amberAccent, // Splash color
                                onTap: () {
                                  setState(() {
                                    _targetImageUrl == "assets/images/barbell.png";
                                  });
                                  // dragController.jumpTo(AnchoringPosition.topRight);
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/barbell.png",
                                        ),
                                        fit: BoxFit.cover),
                                    //color: Color(0xFF434454),
                                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "assets/images/exercise.png",
                        child: Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/exercise.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Material(
                              color: const Color(0xFF1d202b), // Button color
                              child: InkWell(
                                splashColor: Colors.amberAccent, // Splash color
                                onTap: () {
                                  // dragController.jumpTo(AnchoringPosition.topRight);
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/exercise.png",
                                        ),
                                        fit: BoxFit.cover),
                                    //color: Color(0xFF434454),
                                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "assets/images/fitness.png",
                        child: Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: Image.asset(
                            'assets/images/fitness.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Material(
                              color: const Color(0xFF1d202b), // Button color
                              child: InkWell(
                                splashColor: Colors.amberAccent, // Splash color
                                onTap: () {
                                  // dragController.jumpTo(AnchoringPosition.topRight);
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/fitness.png",
                                        ),
                                        fit: BoxFit.cover),
                                    //color: Color(0xFF434454),
                                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Draggable<String>(
                        data: "assets/images/meditation.png",
                        child: Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/meditation.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Material(
                              color: const Color(0xFF1d202b), // Button color
                              child: InkWell(
                                splashColor: Colors.amberAccent, // Splash color
                                onTap: () {
                                  setState(() {
                                    _targetImageUrl == "assets/images/meditation.png";
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/meditation.png",
                                        ),
                                        fit: BoxFit.cover),
                                    //color: Color(0xFF434454),
                                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "assets/images/running.png",
                        child: Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/running.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Material(
                              color: const Color(0xFF1d202b), // Button color
                              child: InkWell(
                                splashColor: Colors.amberAccent, // Splash color
                                onTap: () {
                                  // dragController.jumpTo(AnchoringPosition.topRight);
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/running.png",
                                        ),
                                        fit: BoxFit.cover),
                                    //color: Color(0xFF434454),
                                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "assets/images/walking.png",
                        child: Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: Image.asset(
                            'assets/images/walking.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Material(
                              color: const Color(0xFF1d202b), // Button color
                              child: InkWell(
                                splashColor: Colors.amberAccent, // Splash color
                                onTap: () {
                                  // dragController.jumpTo(AnchoringPosition.topRight);
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/walking.png",
                                        ),
                                        fit: BoxFit.cover),
                                    //color: Color(0xFF434454),
                                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Draggable<String>(
                        data: "assets/images/fitness.png",
                        child: Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          //color: Colors.purple,
                          child: Image.asset(
                            'assets/images/fitness.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Material(
                              color: const Color(0xFF1d202b), // Button color
                              child: InkWell(
                                splashColor: Colors.amberAccent, // Splash color
                                onTap: () {
                                  // dragController.jumpTo(AnchoringPosition.topRight);
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/fitness.png",
                                        ),
                                        fit: BoxFit.cover),
                                    //color: Color(0xFF434454),
                                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "assets/images/yoga.png",
                        child: Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/yoga.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Material(
                              color: const Color(0xFF1d202b), // Button color
                              child: InkWell(
                                splashColor: Colors.amberAccent, // Splash color
                                onTap: () {
                                  setState(() {
                                    _targetImageUrl == "assets/images/yoga.png";
                                  });
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/yoga.png",
                                        ),
                                        fit: BoxFit.cover),
                                    //color: Color(0xFF434454),
                                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Draggable<String>(
                        data: "assets/images/yoga-pose.png",
                        child: Container(
                          width: 38,
                          height: 38,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/yoga-pose.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // The widget to show under the pointer when a drag is under way
                        feedback: Opacity(
                          opacity: 0.4,
                          child: ClipOval(
                            child: Material(
                              color: const Color(0xFF1d202b), // Button color
                              child: InkWell(
                                splashColor: Colors.amberAccent, // Splash color
                                onTap: () {
                                  // dragController.jumpTo(AnchoringPosition.topRight);
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/yoga-pose.png",
                                        ),
                                        fit: BoxFit.cover),
                                    //color: Color(0xFF434454),
                                    //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: VerticalDivider(
              thickness: 3,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          SizedBox(
            height: 190,
            width: 100,
            /*decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),*/
            child: _imageView(),
          ),
        ],
      ),
    );
  }

  Widget _imageView() {
    return Center(
        child: ClipOval(
      child: Material(
        color: const Color(0xFF1d202b),
        child: DottedBorder(
          padding: const EdgeInsets.all(15.0),
          dashPattern: const [10, 10],
          strokeWidth: 2,
          strokeCap: StrokeCap.round,
          color: const Color(0xFF959595),
          borderType: BorderType.Circle,
          child: ClipOval(
            child: Material(
              color: const Color(0xFF1d202b),
              child: DottedBorder(
                padding: const EdgeInsets.all(15.0),
                dashPattern: const [10, 10],
                strokeWidth: 2,
                strokeCap: StrokeCap.round,
                color: const Color(0xFF959595),
                borderType: BorderType.Circle,
                child: DragTarget<String>(
                  onAccept: (value) {
                    setState(() {
                      _targetImageUrl = value;
                    });
                  },
                  builder: (_, candidateData, rejectedData) {
                    return Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      child: _targetImageUrl != null
                          ? Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: _targetImageUrl != null
                            ? Image.asset(
                          _targetImageUrl!,
                          fit: BoxFit.cover,
                        )
                            : Container(),
                      )

                          : Container(),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget _enterDetails(Size size) {
    return TextFormField(
      controller: _productDescriptionController,
      autovalidateMode: _autoValidateMode,
      validator: SimpleFunctions.nameValidator,
      cursorColor:
      Colors.amberAccent,
      minLines: 1,//Normal textInputField will be displayed
      maxLines: 2,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 100.0, right: 100.0, ),
        hintText: 'Enter text...',
        hintStyle: const TextStyle(letterSpacing: 2, color: Colors.grey,),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color:
            Colors.grey,
          ),
          borderRadius:
          BorderRadius.circular(10.0),
        ),
      ),
        keyboardType: TextInputType.name,
    );

  }

  Widget _productName() {
    return const Align(
      alignment: Alignment.topLeft,
      child: DefaultTextStyle(
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
        child: Text('PRODUCT NAME'),
      ),
    );
  }

  Widget _enterDetailsText() {
    return const Align(
      alignment: Alignment.topLeft,
      child: DefaultTextStyle(
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
        child: Text('ENTER DETAILS'),
      ),
    );
  }

  Widget _iconName() {
    return const Align(
      alignment: Alignment.topLeft,
      child: DefaultTextStyle(
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
        child: Text('CHOOSE ICON'),
      ),
    );
  }

  Widget _stepper(BuildContext context, Size screenSize) {
    return const Padding(
      padding: EdgeInsets.only(left: 26.0, right: 26.0, top: 8.0, bottom: 8.0),
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

  Widget _closeButton(BuildContext context, Size screenSize) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 6.0,
        top: 12.0,
      ),
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
              child: const SizedBox(
                  width: 20,
                  height: 20,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.close,
                      size: 15,
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
