import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';


class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({Key? key}) : super(key: key);

  @override
  State<CreateProjectScreen> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProjectScreen> {
  late Size screenSize;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(

          leading:  IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ), onPressed: () {  },
          ),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          //centerTitle: true,
          title:  Text("PRODUCTS & SERVICES", style: Theme.of(context)
              .textTheme
              .headline6
          !.copyWith(color: Colors.white)),
        ),
       body: _scaffoldBody(context,screenSize),
      ),
    );

  }

  Widget _scaffoldBody(BuildContext context,Size screenSize){
    return  Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff213A50),
                  Color(0xff071930)
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight)),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        width: screenSize.width,
        child: Text("l"));

  }

}

