import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopapp/modules/LoginScreen/shopLoginScreen.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/network/local/cahchhelper.dart';
import 'package:shopapp/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
      image:
          'https://media.istockphoto.com/vectors/woman-finding-a-shop-using-her-smartphone-vector-id1189916821?k=20&m=1189916821&s=612x612&w=0&h=9xdh1xnBDQ406esDruPKhJSjAWHU8H-ZZqtn-enfcTI=',
      title: 'On Board 1 Title',
      body: 'On Board 1 body',
    ),
    OnBoardingModel(
      image:
          'https://media.istockphoto.com/vectors/woman-finding-a-shop-using-her-smartphone-vector-id1189916821?k=20&m=1189916821&s=612x612&w=0&h=9xdh1xnBDQ406esDruPKhJSjAWHU8H-ZZqtn-enfcTI=',
      title: 'On Board 2 Title',
      body: 'On Board 2 body',
    ),
    OnBoardingModel(
      image:
          'https://media.istockphoto.com/vectors/woman-finding-a-shop-using-her-smartphone-vector-id1189916821?k=20&m=1189916821&s=612x612&w=0&h=9xdh1xnBDQ406esDruPKhJSjAWHU8H-ZZqtn-enfcTI=',
      title: 'On Board 3 Title',
      body: 'On Board 3 body',
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, ShopLoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(function: submit, text: 'skip'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else
                    setState(() {
                      isLast = false;
                    });
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10.0,
                    activeDotColor: defaultColor,
                    dotWidth: 10.0,
                    spacing: 5.0,
                    expansionFactor: 3.0,
                  ),
                  count: boarding.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast == true) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(OnBoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: NetworkImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      );
}
