import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../utils/common/validation.dart';
import '../widgets/buttonWidget.dart';

class AddPriceScreen extends StatefulWidget {
  const AddPriceScreen({Key? key}) : super(key: key);

  @override
  State<AddPriceScreen> createState() => _AddPriceState();
}

class _AddPriceState extends State<AddPriceScreen> {
  double _value = 45.0;
  int selectedIndex = 0;
  late WeightSliderController _controller = WeightSliderController();
  final AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController _priceController = TextEditingController();
  double _weight = 45.0;
  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(initialWeight: _weight, minWeight: 0, interval: 0.1);
  }

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
      child:  Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Container(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
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
              _closeButton(context, screenSize),
              _priceName(),
              const SizedBox(
                height: 10,
              ),
              _stepper(context, screenSize),
              const SizedBox(
                height: 30,
              ),
              _priceDetails(context, screenSize),
              const SizedBox(
                height: 200,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style:ElevatedButton.styleFrom(
                  fixedSize: const Size(140, 45),
                  primary: selectedIndex == 1 ?  Colors.black : const Color(0xFF959595),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: (){
                    setState(() {
                      selectedIndex == 0;
                    });
                    Navigator.pop(context);
                },
                child: const Text(
                  "PREVIOUS",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              ElevatedButton(
                style:ElevatedButton.styleFrom(
                  fixedSize: const Size(140, 45),
                  primary: Colors.amberAccent.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: (){
                  Fluttertoast.showToast(
                      msg: "Finished",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.amberAccent,
                      fontSize: 16.0
                  );


                },
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          )


            ],
          ),
        ),
      ),
    );
  }
  Widget _priceDetails(BuildContext context, Size screenSize){
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: screenSize.height / 2.5,
      width: screenSize.width * 2,
      decoration: const BoxDecoration(
        color: Color(0xFF1d202b),
       // border: Border.all(color: Color(0xFF1d202b)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child:   Material(
        color: const Color(0xFF1d202b),
          child: Container(
            height: 900,
            color: const Color(0xFF1d202b),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //padding: EdgeInsets.all(4),
                    height: 40,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xFF434454),
                      // border: Border.all(color: Color(0xFF1d202b)),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(
                      child: Text(  '₺  ' "${_weight.toStringAsFixed(2)}",style:
                      Theme.of(context)
                          .textTheme
                          .headline6
                      !.copyWith(color: Colors.amberAccent)),
                    ),
                  ),
                ),
                Expanded(
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(90 / 360),
                    child: VerticalWeightSlider(
                      controller: _controller,

                      decoration: const PointerDecoration(
                        width: 120.0,
                        height: 3.0,
                        largeColor: Color(0xFF898989),
                        mediumColor: Color(0xFFC5C5C5),
                        smallColor: Color(0xFFF0F0F0),
                        gap: 30.0,
                      ),
                      onChanged: (double value) {
                        setState(() {
                          _weight = value;
                        });
                      },
                      indicator: Container(
                        height: 3.0,
                        width: 160.0,
                        alignment: Alignment.centerLeft,
                        color: Colors.amberAccent
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )
    ),
    );
  }
  Widget _enterPrice(Size size) {
    return TextFormField(
    textAlign: TextAlign.center,
    style:  Theme.of(context)
        .textTheme
        .headline6
    !.copyWith(color: Colors.amberAccent),
    controller: _priceController,
    keyboardType: TextInputType.number,
    validator: SimpleFunctions.numberValidator,
      );

  }
  Widget _priceName() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Center(
        child: DefaultTextStyle(
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
          child: Text('ADD PRICE'),
        ),
      ),
    );
  }
  Widget _stepper(BuildContext context, Size screenSize) {
    return const Padding(
      padding: EdgeInsets.only(left: 26.0, right: 26.0, top: 8.0, bottom: 8.0),
      child: StepProgressIndicator(
        totalSteps: 4,
        padding: 4,
        currentStep: 2,
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
