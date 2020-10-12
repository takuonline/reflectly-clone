import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_reflectly/components/add_note/add_note_pageview.dart';
import 'package:my_reflectly/components/constants.dart';

class TextNote extends StatelessWidget {
  const TextNote(
      {Key key,
      @required this.screenWidth,
      @required this.screenHeight,
      this.title,
      this.notes,
      this.icon,
      this.activities,
      this.feelings,
      this.index,
      this.isDragged})
      : super(key: key);

  final double screenWidth;
  final double screenHeight;

  final String title;
  final String notes;
  final IconData icon;
  final List<NoteIconsWithNames> activities;
  final List<NoteIconsWithNames> feelings;

  final int index;

  final bool isDragged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.only(left: 100, bottom: 10),
      width: screenWidth * .8,
      height: notes != '' ? screenHeight / 5.1 : screenHeight / 5.5,
      constraints: BoxConstraints(minHeight: screenHeight * .15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.05),
              spreadRadius: 1,
              blurRadius: 50,
              offset: Offset(40, 10))
        ],
        color: Colors.white,
        borderRadius: isDragged
            ? BorderRadius.all(Radius.circular(25))
            : BorderRadius.horizontal(
                left: Radius.circular(25),
              ),
      ),
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-70, 40),
            child: Icon(Icons.edit, color: Colors.grey),
          ),
          Transform.translate(
            offset: Offset(-30, 0),
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Icon(
                icon,
                size:90,
                color: Color(0xffeeeeee),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff777777),
                      fontSize: 17,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 5.0,
                ),
                if (notes != '')
                  Text(
                    '$notes',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Color(0xff777777), fontSize: 12),
                  ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '${TimeOfDay.now().format(context)} ',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Color(0xff777777), fontSize: 12),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 25,
                      width: 110,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: activities
                                .map(
                                  (e) => Icon(
                                    e.icon,
                                    color: Color(0xffaaaaaa),
                                  ),
                                )
                                .toList(),
                          ),
                          Row(
                            children: feelings
                                .map(
                                  (e) => Icon(
                                    e.icon,
                                    color: Color(0xffaaaaaa),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
