import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:excelledia_design/view/pages/add_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../utils/constants.dart';
import '../widgets/buttonWidget.dart';


class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  State<CreateProjectScreen> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProjectScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const  Color(0xFF1d202b),
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
          title:  Text("PRODUCTS & SERVICES",style :Theme.of(context)
              .textTheme
              .headline6
          !.copyWith(color: Colors.white)),
          backgroundColor:  const Color(0xFF1d202b),
          //backgroundColor: const Color(0xFF313131),
          centerTitle: true,
          ),
      body: _scaffoldBody(context,screenSize),
    );
  }

  Widget _scaffoldBody(BuildContext context, Size size) {
    return Center(
        child : Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Container(
            height: size.height * 0.82,
            width: size.width * 0.87,
            decoration: const BoxDecoration(
             //image: DecorationImage(image: AssetImage("assets/images/bg.png",),fit: BoxFit.cover),
              color: Color(0xFF434454),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _tabBar(),
                const SizedBox(height: 120,),
                _imageView(),
                const SizedBox(height: 40,),
                _textView(),
                const SizedBox(height: 140,),
                ButtonWidget(
                  title: "ADD NOW",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddProductScreen(

                          )),
                    );
                  },

                ),

              ],
            ),
          ),
        )
    );
  }

Widget _textView(){
    return Column(
      children: [
        Text( selectedIndex == 0 ?"ADD YOUR PRODUCT" : "ADD YOUR SERVICE",style:
        Theme.of(context)
        .textTheme
        .headline6
    !.copyWith(color: Colors.white),

        ),
        const SizedBox(height: 20,),
        const Text("You can upload programs for your clients", style: TextStyle(
          color: Colors.white,
          //  fontWeight: FontWeight.bold

        ),),

        const Text(" as well as other products here", style: TextStyle(
          color: Colors.white,

        ),),
      ],
    );
}
  Widget _imageView(){
    return Center(
      child: DottedBorder(
      padding: const EdgeInsets.all(15.0),
      dashPattern: const [10, 10],
      strokeWidth: 2,
      strokeCap: StrokeCap.round,
      color: const Color(0xFF959595),
      borderType: BorderType.Circle,
      child: Lottie.asset('assets/add.json',height: 100,width: 100, repeat: true),
        ),
    );

  }

  Widget _tabBar(){
    return Container(
      decoration:  const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
      ),
      height: 50,
      child: Row(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                selectedIndex = 0;
              });
            },
            child: Container(
              decoration:  BoxDecoration(
                border: selectedIndex == 0 ? Border.all(
                    color: Colors.amberAccent,
                    width: 1
                ) : null,
                 color: selectedIndex == 0 ? Colors.black : Color(0xFF959595),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0)),
              ),
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.height * 0.42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.production_quantity_limits_sharp,
                    color: Colors.amberAccent,
                    size: 16,
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Text("PRODUCT",
                    style: TextStyle(
                        color: Colors.amberAccent
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                selectedIndex = 1;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.42,
              decoration:  BoxDecoration(
                border: selectedIndex == 1 ? Border.all(
                    color: Colors.amberAccent,
                    width: 1
                ) : null,
                color: selectedIndex == 1 ? Colors.black : Color(0xFF959595)  ,
                borderRadius: BorderRadius.only(topRight: const Radius.circular(20.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Icon(Icons.miscellaneous_services_outlined,
                    color: selectedIndex == 1 ?  Colors.amberAccent :Colors.white,
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Text("SERVICE",
                    style: TextStyle(
                        color: selectedIndex == 1 ?  Colors.amberAccent : Colors.white
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }


}

