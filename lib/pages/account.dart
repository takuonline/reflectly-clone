import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_reflectly/components/navbar/nav_btn.dart';
import 'package:my_reflectly/components/navbar/navbar.dart';

import 'package:my_reflectly/providers/stored_moments_provider.dart';
import 'package:my_reflectly/providers/show_add_note_provider.dart';
import 'package:my_reflectly/providers/username_provide.dart';
import 'package:provider/provider.dart';

class Account extends StatefulWidget {
  static String id = 'Account';
  final PageController  controller ;


  Account(this.controller);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _isVisible = true;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;


      List _storedMoments  =  Provider.of<StoredMoments>(context).items;


    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: screenheight * .33,
                        decoration: BoxDecoration(
                            color: Color(0xff0093E9),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12))),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey.withOpacity(.4),
                          size: 100.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.only(top: 150),
                              child: Text(
                            '${context.watch<UserName>().userName}',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                            //determine whether to show moments or moment
                _storedMoments.length<2?AccountIcons(Icons.edit, '${_storedMoments.length}', 'Moment'):
                    AccountIcons(Icons.edit, '${_storedMoments.length}', 'Moments'),
                    AccountIcons(Icons.image, '0', 'Photos'),
                    AccountIcons(Icons.message, '0', 'Reflections'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
//                    padding: EdgeInsets.symmetric(horizontal: 50),
                  height: screenheight * .155,
                  width: screenWidth * .9,

                  decoration: BoxDecoration(
                      color: Color(0xff0093E9),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      child: Text(
                        ' Unlock Reflectly and become your own hero',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: <Widget>[
                      RateAndSupportCard(
                          Icon(
                            Icons.star_border,
                            color: Colors.white,
                          ),
                          screenheight,
                          Text(
                            'Rate Reflectly 5-starts',
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                          'Rate',
                          Color(0xff0093E9)),
                      SizedBox(
                        width: 20,
                      ),
                      RateAndSupportCard(
                          Icon(
                            Icons.chat,
                            color: Color(0xff0093E9),
                          ),
                          screenheight,
                          Text(
                            'Constact support',
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color:Colors.black),
                          ),
                          'Support',
                          Colors.white)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,bottom: 100,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      RateAndSupportCard(
                          Icon(
                            Icons.public,
                            color: Color(0xff0093E9),
                          ),
                          screenheight,
                          Text(
                            'Join the community',
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color:Colors.black),
                          ),
                          'Community',
                          Colors.white),
                      SizedBox(
                        width: screenWidth*.47,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 40,
            child: GestureDetector(
              onTap: (){
//                    Navigator.pushNamed(context, SettingsPage.id);
              widget.controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Container(
                height: 45,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(200)),
                  color: Colors.white,
                  boxShadow:[BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      offset: Offset(0,0),
                      spreadRadius: .1,
                      blurRadius:30
                  )] ,

                ),
                child: Icon(
                Icons.settings,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          if (context.watch<IsPopUpOn>().isPopUpOn)
            GestureDetector(
              onTap: () => context.read<IsPopUpOn>().togglePopUp(),
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                color: Colors.white.withOpacity(.5),
                width: screenWidth,
                height: screenheight,
              ),
            ),
          Navbar(  isVisible: _isVisible,),
          Navbtn(screenheight: screenheight,showAddNote:false ,),
        ],
      ),
    );
  }
}

class RateAndSupportCard extends StatelessWidget {
  final double screenheight;
  final Icon icon;
  final String text;
  final Text description;
  final Color color;

  RateAndSupportCard(
      this.icon, this.screenheight, this.description, this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        height: screenheight * .3,
        child: Stack(

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25,top: 100),
              child: Text(
                text,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.grey.withOpacity(.2),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[icon, description],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountIcons extends StatelessWidget {
  final IconData icon;
  final String number;
  final String name;

  AccountIcons(
    this.icon,
    this.number,
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Stack(
        children: <Widget>[
          Icon(
            icon,
            size: 80,
            color: Color(0xff0093E9).withOpacity(.04),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  number,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
