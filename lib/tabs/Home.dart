import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:protest/colors.dart';
import 'package:protest/login_page.dart';
import 'package:protest/menu/Challenges.dart';
import 'package:protest/menu/Help.dart';
import 'package:protest/menu/Locations.dart';
import 'package:protest/menu/Products.dart';
import 'package:protest/menu/register/Register.dart';
import 'package:protest/menu/Share.dart';
// import 'package:protest/menu/convert_coins.dart';
import 'package:get/get.dart';
// import 'package:hovering/hovering.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _menuSelector(@required String image, @required String name) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors_selector.grey, width: 2)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image)),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  final List<String> images = [
    'https://media.licdn.cn/dms/image/C4E1BAQHkN7Cli0qSYw/company-background_10000/0/1607605666419?e=2159024400&v=beta&t=hylf9iaLVH9MRMFrjyPsTA7jV9kq81sVfuECjLlHp38',
    'https://i0.wp.com/www.elelanjobs.com/wp-content/uploads/2022/07/photo_2022-07-11_11-45-13.jpg?w=1280&ssl=1',
    'https://pbs.twimg.com/media/FgtTwl2X0AAG4fg.jpg',
    'https://pbs.twimg.com/media/FhWwJI4WAAQ6vao?format=jpg&name=large',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbYLjD2pzvno_e9lVCDpt8OWmyfH_2Cu3NZw&usqp=CAU',
  ];
  List<Widget> generateImagesTiles() {
    return images
        .map((element) => ClipRRect(
              child: Image.network(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: Colors_selector.primaryColor,
      backgroundColor: Colors_selector.secondaryColor,
      onRefresh: _handleRefresh,
      animSpeedFactor: 2,
      // height: 250,
      springAnimationDurationInMilliseconds: 1500,
      child: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors_selector.pair1, Colors_selector.pair2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Column(children: [
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                "Latest".tr,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
              ),
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: EdgeInsets.only(top: 20),
              child: CarouselSlider(
                items: generateImagesTiles(),
                options:
                    CarouselOptions(autoPlay: true, enlargeCenterPage: true),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Menu".tr,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          height: 450,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showChallengeDialog(context);
                                },
                                child: _menuSelector(
                                    "assets/images/Challenges.png",
                                    "Challenges".tr),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ShowSimpleDialog(context);
                                },
                                child: _menuSelector(
                                    "assets/images/coin_Exchange.png",
                                    "Convert Coins".tr),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: _menuSelector(
                                    "assets/images/customer.png",
                                    "Register".tr),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Locations()));
                                },
                                child: _menuSelector(
                                    "assets/images/location.png",
                                    "Locations".tr),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Share()),
                                    );
                                  },
                                  child: _menuSelector(
                                      "assets/images/Share.png", "Share".tr)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Help()),
                                    );
                                  },
                                  child: _menuSelector(
                                      "assets/images/help.png", "Help".tr)),
                              GestureDetector(
                                onTap: () {
                                  LaunchReview.launch(
                                      androidAppId: "com.example.CooPlay");
                                },
                                child: _menuSelector(
                                    "assets/images/golden.png", "Rate us".tr),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Products()));
                                },
                                child: _menuSelector("assets/images/other.png",
                                    "Other products".tr),
                              ),
                            ],
                          ),
                        )),
                  ]),
            )
          ]),
        ),
      )),
    );
  }

  void ShowSimpleDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "  You have 4.2 Golden coins  ".tr,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "  which is equal to 25 Birr  ".tr,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Withdraw to your account ".tr,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors_selector.primaryColor),
                      child: Text(
                        "withdraw".tr,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "convert to a mobile topup".tr,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors_selector.primaryColor),
                      child: Text(
                        "Convert".tr,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(height: 15),
                ],
              ),
            ));
      });

  void showChallengeDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "If you want to see your products gifts press here.".tr,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors_selector.primaryColor),
                      child: Text(
                        "Gifts".tr,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Challenges()));
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "If you want to try some challenges press here.".tr,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors_selector.primaryColor),
                      child: Text(
                        "Challenges".tr,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Challenges()));
                      }),
                  SizedBox(height: 15),
                ],
              ),
            ));
      });
}
