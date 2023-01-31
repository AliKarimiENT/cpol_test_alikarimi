import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import '../widgets/splash_logo.dart';


late SharedPreferences pref;
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      SharedPreferences.getInstance().then((value) async{
        pref = value;
        print('build completed');
        await Future.delayed(Duration(milliseconds: 1500));
        bool hasToken = checkHasToken();
        if(!hasToken){
          Navigator.pushNamed(context, 'verification');
        }else{

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset('assets/svgs/union.svg'),
          ),
          Positioned(
            top: height / 3,
            right: -30,
            child: SvgPicture.asset(
              'assets/svgs/ellipse.svg',
              width: 100,
              color: Colors.white.withOpacity(0.21),
            ),
          ),
          Positioned(
            top: height / 10,
            left: 0,
            child:
                SvgPicture.asset('assets/svgs/curvedRectangle.svg', width: 150),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Spacer(
                flex: 1,
              ),
              SplashLogoWidget(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'نسخه 0.0.1',
                      style: TextStyle(
                          fontFamily: 'Yekan',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  bool checkHasToken() {
    var result = pref.getString('token');
    if (result == null || result == '') {
      return false;
    } else {
      return true;
    }
  }
}
