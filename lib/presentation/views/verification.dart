import 'package:cpol_test_alikarimi/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    with TickerProviderStateMixin {
  final phoneEntryController = TextEditingController();
  final pinController = TextEditingController();

  final _phoneFormKey = GlobalKey<FormState>();
  final _codeFromKey = GlobalKey<FormState>();

  final focusNode = FocusNode();

  late PageController _pageController;

  PageController get pageController => _pageController;

  late AnimationController animationController;

  late String phoneNumber;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 120),
    );
  }

  @override
  void dispose() {
    phoneEntryController.dispose();
    _pageController.dispose();
    pinController.dispose();
    focusNode.dispose();
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: buildFloatingButton(context),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                fillOverscroll: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 48),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        'assets/svgs/defense.svg',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'خوش آمدید',
                      style: TextStyle(
                        fontFamily: 'IranSans',
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: PageView(
                        controller: pageController,
                        pageSnapping: true,
                        allowImplicitScrolling: false,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          mobileEntryView(context),
                          codeVerificationView()
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget codeVerificationView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  await pageController.previousPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff22384B).withOpacity(0.05),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 12,
                        color: const Color(0xff22384B).withOpacity(0.5),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        phoneEntryController.value.text.toString(),
                        style: TextStyle(
                          fontFamily: 'IranSans',
                          fontSize: 12,
                          color: const Color(0xff22384B).withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Flexible(
                child: Text(
                  'کد 4رقمی که از طریق پیامک ارسال شد را وارد کنید',
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'IranSans',
                    fontSize: 12,
                    color: Color(0xffC6C6C8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Form(
            key: _codeFromKey,
            child: Row(
              children: [
                Expanded(
                  child: PinCodeFields(
                    controller: pinController,
                    length: 4,
                    keyboardType: TextInputType.phone,
                    animationDuration: const Duration(milliseconds: 200),
                    animationCurve: Curves.easeInOut,
                    switchInAnimationCurve: Curves.easeIn,
                    switchOutAnimationCurve: Curves.easeOut,
                    animation: Animations.slideInDown,
                    onComplete: (output) {
                      // Your logic with code
                      print(output);
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      iconSize: 20,
                      padding: const EdgeInsets.all(4),
                      onPressed: () {
                        pinController.clear();
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: const Color(0xff22384B).withOpacity(0.5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(color: Color(0xff22384B).withOpacity(0.1)),
          SizedBox(height: 32),
          Row(
            children: [
              AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  Duration count =
                      animationController.duration! * animationController.value;
                  var second =
                      (count.inSeconds % 60).toString().padLeft(2, '0');
                  var minute = (count.inMinutes).toString().padLeft(2, '0');
                  return Text(
                    '$minute:$second',
                    style: const TextStyle(
                      fontFamily: 'IranSans',
                      fontSize: 12,
                      color: Color(0xff22384B),
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
              Text(
                'ارسال مجدد',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'IranSans',
                  fontSize: 12,
                  color: const Color(0xff22384B).withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget mobileEntryView(BuildContext context) {
    return Column(
      children: [
        Text(
          'جهت ورود، شماره موبایل خود را وارد کنید',
          style: TextStyle(
            fontFamily: 'IranSans',
            fontSize: 12,
            color: const Color(0xff22384B).withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _phoneFormKey,
            child: TextFormField(
              controller: phoneEntryController,
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
              onFieldSubmitted: (value) => phoneNumber = value,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorStyle: const TextStyle(fontFamily: 'IranSans'),
                border: const UnderlineInputBorder(),
                focusColor: Theme.of(context).primaryColor,
                hintText: '۰۹۱۲XXXXXXX',
                hintStyle: TextStyle(
                  fontFamily: 'IranSans',
                  fontSize: 17,
                  color: const Color(0xff22384B).withOpacity(0.5),
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.all(4),
                  onPressed: () {
                    phoneEntryController.clear();
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
              validator: (value) {
                if (value != '') {
                  if (!Validators.validatePhoneNumber(value!)) {
                    return 'شماره موبایل معتبر را وارد کنید';
                  } else {
                    return null;
                  }
                } else {
                  return 'مقدار خواسته شده را وارد نمائید';
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  MaterialButton buildFloatingButton(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Theme.of(context).primaryColor,
      onPressed: () {
        print('Current page num is ${pageController.page}');
        if (pageController.page == 0) {
          if (_phoneFormKey.currentState!.validate()) {
            pageController.nextPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
            );
            animationController.reverse(
                from: animationController.value == 0
                    ? 1.0
                    : animationController.value);
          }
        }
      },
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
