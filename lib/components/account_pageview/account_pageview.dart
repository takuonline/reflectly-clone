import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_reflectly/pages/account_pageview.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class SettingsPage2 extends StatefulWidget {
  SettingsPage2(this._controller);

  final PageController _controller;

  @override
  _SettingsPage2State createState() => _SettingsPage2State();
}

class _SettingsPage2State extends State<SettingsPage2> {
  int _focusedIndex = 0;

  List<Color> colorsList = [
    Colors.black,
    Colors.yellow,
    Colors.orange,
    Colors.green,
    Colors.purple
  ];

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
      child: Container(
        width: 80,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colorsList[index],
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Colors.white,
            width: 5.0,
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool onWillPop() {
      widget._controller
          .previousPage(duration: Duration(seconds: 1), curve: Curves.ease);
      return false;
    }

    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: screenWidth * .45,
                              height: screenheight * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.person,
                                size: 90,
                                color: Colors.grey.withOpacity(.4),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Container(
                            width: 300.0,
                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(.05),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                cursorColor: Colors.purpleAccent,
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.white),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'What do l call you?',
                                    hintStyle: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 300.0,
                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(.05),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                cursorColor: Colors.purpleAccent,
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.white),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Example@email.com',
                                    hintStyle: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                FontAwesomeIcons.creditCard,
                                color: Colors.black54.withOpacity(.1),
                                size: 100,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Reflectly Basic',
                                  style: TextStyle(
                                      fontSize: 21, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Active Plan',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(.4)),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  SettingsCard('Disabled', 'BIOMETRIC PASSCODE',
                      FontAwesomeIcons.fingerprint),
                  SizedBox(
                    height: 15,
                  ),
                  SettingsCard('Disabled', 'DARK MODE', FontAwesomeIcons.moon),
                  SizedBox(
                    height: 15,
                  ),
                  SettingsCard2(
                      'Add custom activities by selecting \'other\' when creating a moment'),
                  SizedBox(
                    height: 15,
                  ),
                  SettingsCard2(
                      'Add custom feelings by selecting \'other\' when creating a moment'),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '8:00 AM',
                                      style: TextStyle(
                                          fontSize: 21, color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'MORNING',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(.4)),
                                    )
                                  ],
                                ),
                              ),
                              Slider(
                                value: 8,
                                onChanged: (double value) {},
                                max: 11,
                                min: 5,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '8:00 PM',
                                      style: TextStyle(
                                          fontSize: 21, color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'EVENING',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(.4)),
                                    )
                                  ],
                                ),
                              ),
                              Slider(
                                value: 8,
                                onChanged: (double value) {},
                                max: 11,
                                min: 5,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: screenWidth * .9,
                    height: screenheight * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -10,
                          top: 30,
                          bottom: 30,
                          child: Icon(
                            FontAwesomeIcons.palette,
                            size: 120,
                            color: Colors.black.withOpacity(.1),
                          ),
                        ),
                        Center(
                          child: Container(
                            constraints: BoxConstraints(maxHeight: 90),
                            child: ScrollSnapList(
                              onItemFocus: _onItemFocus,
                              itemSize: 100,
                              itemBuilder: _buildListItem,
                              itemCount: colorsList.length,
                              scrollDirection: Axis.horizontal,
                              dynamicItemSize: true,
                              initialIndex: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 210,
                  ),
                ],
              ),
            ),
            Positioned(
                left: 0,
                top: 40,
                child: GestureDetector(
                  onTap: () {
                    widget._controller.previousPage(
                        duration: Duration(seconds: 1), curve: Curves.ease);
                  },
                  child: Container(
                    height: 45,
                    width: 80,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 0),
                            spreadRadius: .1,
                            blurRadius: 20)
                      ],
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(200)),
                      color: Colors.white,
                    ),
                    child: Icon(
                      FontAwesomeIcons.longArrowAltLeft,
                      color: Colors.black,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
