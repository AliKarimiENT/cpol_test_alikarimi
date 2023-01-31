import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final firstNameEntryController = TextEditingController();
  final lastNameEntryController = TextEditingController();
  final bioEntryController = TextEditingController();

  late double width;
  @override
  void dispose() {
    firstNameEntryController.dispose();
    lastNameEntryController.dispose();
    bioEntryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: buildFloatingButton(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 24),
                buildImagePart(),
                const SizedBox(height: 24),
                buildNameInputPart(context),
                const SizedBox(height: 24),
                buildBioInputPart(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBioInputPart(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              controller: bioEntryController,
              decoration: InputDecoration(
                errorStyle: const TextStyle(fontFamily: 'IranSans'),
                border: const UnderlineInputBorder(),
                focusColor: Theme.of(context).primaryColor,
                hintText: 'دلنوشته یا شعار (اختیاری)',
                hintStyle: TextStyle(
                  fontFamily: 'IranSans',
                  fontSize: 17,
                  color: const Color(0xff22384B).withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: IconButton(
                  iconSize: 20,
                  padding: const EdgeInsets.all(4),
                  onPressed: () {
                    bioEntryController.clear();
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: const Color(0xff22384B).withOpacity(0.5),
                  ),
                ),
                suffixStyle: TextStyle(
                  fontFamily: 'IranSans',
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            width: width / 6,
            child: const Text(
              'درباره',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: 'IranSans',
                fontSize: 16,
                color: Color(0xff22384B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNameInputPart(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextField(
                  controller: firstNameEntryController,
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(fontFamily: 'IranSans'),
                    border: const UnderlineInputBorder(),
                    focusColor: Theme.of(context).primaryColor,
                    hintText: 'نام',
                    hintStyle: TextStyle(
                      fontFamily: 'IranSans',
                      fontSize: 17,
                      color: const Color(0xff22384B).withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: IconButton(
                      iconSize: 20,
                      padding: const EdgeInsets.all(4),
                      onPressed: () {
                        firstNameEntryController.clear();
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: const Color(0xff22384B).withOpacity(0.5),
                      ),
                    ),
                    suffixStyle: TextStyle(
                      fontFamily: 'IranSans',
                      fontSize: 17,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                TextField(
                  controller: lastNameEntryController,
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(fontFamily: 'IranSans'),
                    border: const UnderlineInputBorder(),
                    focusColor: Theme.of(context).primaryColor,
                    hintText: 'نام خانوادگی (اختیاری)',
                    hintStyle: TextStyle(
                      fontFamily: 'IranSans',
                      fontSize: 17,
                      color: const Color(0xff22384B).withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: IconButton(
                      iconSize: 20,
                      padding: const EdgeInsets.all(4),
                      onPressed: () {
                        lastNameEntryController.clear();
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: const Color(0xff22384B).withOpacity(0.5),
                      ),
                    ),
                    suffixStyle: TextStyle(
                      fontFamily: 'IranSans',
                      fontSize: 17,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            width: width / 6,
            child: const Text(
              'نام',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontFamily: 'IranSans',
                fontSize: 16,
                color: Color(0xff22384B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImagePart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: CircleAvatar(
            backgroundColor: Color(0xff488CD6),
            radius: 24,
            child: Image.asset('assets/pngs/cameraAdd.png'),
          ),
        ),
        SizedBox(
          width: width / 6,
          child: const Text(
            'تصویر',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontFamily: 'IranSans',
              fontSize: 16,
              color: Color(0xff22384B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shape: const Border(
        bottom: BorderSide(width: 0.5),
      ),
      title: const Text(
        'تکمیل اطلاعات',
        style: TextStyle(
          fontFamily: 'IranSans',
          fontSize: 15,
          color: Color(0xff22384B),
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  'بازگشت',
                  style: TextStyle(
                    fontFamily: 'IranSans',
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        )
      ],
    );
  }

  MaterialButton buildFloatingButton(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Theme.of(context).primaryColor,
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'ادامه',
              style: TextStyle(
                fontFamily: 'IranSans',
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
