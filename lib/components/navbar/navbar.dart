import 'package:flutter/material.dart';
 import 'package:my_reflectly/pages/account.dart';
import 'package:my_reflectly/pages/account_pageview.dart';
import 'package:my_reflectly/pages/notes.dart';

import 'package:my_reflectly/pages/daily_positives.dart';
import 'package:my_reflectly/providers/images_provider.dart';

import 'package:provider/provider.dart';


class Navbar extends StatefulWidget {
  const Navbar({
    Key key,

    @required bool isVisible,
  })  : _isVisible = isVisible,
        super(key: key);


  final bool _isVisible;



  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool isListFilled=false;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Hero(
      tag: 'Navbar',
      child: Align(
        alignment: Alignment.bottomRight,
        child: AnimatedContainer(
          alignment: Alignment.bottomRight,
          width:  screenWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
          duration: Duration(milliseconds: 200),
          height: widget._isVisible ? screenHeight/10 : 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          if (ModalRoute.of(context).settings.name != 'Notes') {
                            Navigator.pushReplacementNamed(context, Moments.id);
                          }
                        },
                        icon: Icon(Icons.note_add, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.insert_chart, color: Colors.grey[400]),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          if (ModalRoute.of(context).settings.name !=
                              'DailyPositives') {
                            Navigator.pushNamed(context, DailyPositives.id);
                          }

//                          if (!isListFilled){
//                            Provider.of<DPImagesProvider>(context,listen: false).fillUpList();
//                            setState(() {
//                              isListFilled=true;
//                            });
//                          }
                        },
                        icon: Icon(Icons.menu, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                        onPressed: () {
                          if (ModalRoute.of(context).settings.name !=
                              'Account') {
                            Navigator.pushReplacementNamed(context, SettingsPage.id);
                          }
                        },
                        icon: Icon(Icons.person, color: Colors.grey[400]),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


