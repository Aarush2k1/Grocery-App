// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/views/auth/registration_screen.dart';

class OnBoard extends StatefulWidget {
  static const String id = 'onBoard';
  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int _currentPage = 0;
  PageController _controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.white10,
        elevation: 0,
        title: Text(
          'Product IO',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: _onPageChanged,
                  itemCount: sliderArrayList.length,
                  itemBuilder: (context, index) {
                    return _currentPage < sliderArrayList.length
                        ? SplashScreen(
                            text: sliderArrayList[index].sliderHeading,
                            image: sliderArrayList[index].sliderImage,
                          )
                        : LastScreen();
                  },
                ),
              ),
              SizedBox(
                height: 28,
              ),
              _currentPage < sliderArrayList.length - 1
                  ? Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                sliderArrayList.length,
                                (index) => buildDot(index: index),
                              ),
                            ),
                            Spacer(),
                            MaterialButton(
                              child: Text(
                                "Next",
                                style: TextStyle(color: kWhiteColor),
                              ),
                              color: kPrimaryColor,
                              onPressed: () {
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.bounceIn);
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  : Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 25 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? kPrimaryColor : kGreyColor6,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class LastScreen extends StatelessWidget {
  const LastScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Text(
            "Continue as ",
            style: TextStyle(fontSize: 36),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                child: Text(
                  "Store Owner",
                  style: TextStyle(fontSize: 18, color: kWhiteColor),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id,
                      arguments: {'args': 'store'});
                },
              ),
              Text('OR', style: Theme.of(context).textTheme.bodyText1),
              MaterialButton(
                child: Text(
                  "Customer",
                  style: TextStyle(fontSize: 18, color: kWhiteColor),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id,
                      arguments: {'args': 'customer'});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, required this.text, required this.image})
      : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            image,
            height: 340,
          ),
        ),
        Spacer(),
        text != ""
            ? Text(
                text,
                style: TextStyle(fontSize: 14),
              )
            : LastScreen(),
      ],
    );
  }
}

class Slider {
  final String sliderImage;
  final String sliderHeading;

  Slider({
    required this.sliderImage,
    required this.sliderHeading,
  });
}

final sliderArrayList = [
  Slider(
    sliderImage: "assets/images/undraw_online_groceries_a02y.svg",
    sliderHeading: "Welcome to ProductIO, Let's shop!",
  ),
  Slider(
    sliderImage: "assets/images/undraw_shopping_app.svg",
    sliderHeading: "We show the easy way to shop. \nJust stay at home with us",
  ),
  Slider(
    sliderImage: "assets/images/undraw_on_the_way.svg",
    sliderHeading: "Delivery made easy",
  ),
  Slider(
    sliderImage: "assets/images/undraw_user_flow.svg",
    sliderHeading: "",
  ),
];
