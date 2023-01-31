import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            SvgPicture.asset('assets/svgs/defense.svg'),
            const Text(
              'پیام رسان سازمانی',
              style: TextStyle(
                  fontFamily: 'Yekan',
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ));
  }
}
