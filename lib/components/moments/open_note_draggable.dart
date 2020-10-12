

import 'package:flutter/material.dart';
import 'package:my_reflectly/components/add_note/add_note_pageview.dart';
import 'package:my_reflectly/components/moments/Icon_moment.dart';
import 'package:my_reflectly/pages/notes.dart';


class OpenNoteDraggable extends StatelessWidget {

  OpenNoteDraggable({this.draggableItem});
  final IconMoment draggableItem;


  @override
  Widget build(BuildContext context) {

    String momentTitle =  draggableItem.title;
    List<NoteIconsWithNames> feelingsList =  draggableItem.feelings;
    List<NoteIconsWithNames> activitiesList =  draggableItem.activities;
    String momentNotes =  draggableItem.addSomeNotes;
    String moodText = draggableItem.moodText;

    String momentTitleValue =
    momentTitle ==  draggableItem.moodText ? '' : momentTitle;
    momentNotes=  draggableItem.addSomeNotes ==''  ? '' : momentNotes;


    return Dismissible(
      key: ValueKey('hero'),
      direction: DismissDirection.down,
      onDismissed: (direction) {
        Navigator.pop(context);
      },
      dismissThresholds: {
        DismissDirection.down: .2,
      },
      child: DraggableScrollableSheet(
        minChildSize: .9,
        initialChildSize: .9,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          double _keyBoardInset = MediaQuery.of(context).viewInsets.bottom;

          return Material(
            color: Colors.transparent,
            child: Container(
              height: 70,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50, right: 50, top: 50, bottom: 30),
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Icon(
                                    Icons.date_range,
                                    color: Colors.black.withOpacity(.2),
                                    size: 40,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Text(
                                      '${ draggableItem.time}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              Center(
                                child: Icon(
                                  Icons.face,
                                  color: Colors.black.withOpacity(.1),
                                  size: 150,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 115),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '$moodText',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
//                          SizedBox(
//                            height: screenHeight * .123,
//                            width: screenWidth,
//                            child: ListView.builder(
//                                itemCount: feelingsList.length,
//                                scrollDirection: Axis.horizontal,
//                                itemBuilder: (_, index) {
//
//
//
//
//
//                                  return activitiesIcon(
//                                      icon: feelingsList[index].icon);
//                                }),
//                          ),
                SizedBox(
                  height:70,

                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(),
                    children:

                    activitiesList.map((e) => activitiesIcon(
                      icon: e.icon,
                    )).toList()  +

                    feelingsList.map((e) => activitiesIcon(
                      icon: e.icon,

                    )).toList()


                  ),
                ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 300.0,
                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(.05),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextFormField(
                                initialValue: momentTitleValue,
                                onTap: () {},
                                onChanged: (text) {

                                },
                                cursorColor: Colors.purpleAccent,
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Moment title ...',
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 300.0,
                            decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(.05),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: TextFormField(
                                initialValue: momentNotes,
                                onTap: () {},
                                onChanged: (text) {

                                },
                                minLines: 1,
                                maxLines: 10,
                                cursorColor: Colors.purpleAccent,
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.black87),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Add some notes ...',
                                  hintStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70+_keyBoardInset,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),

                            // is required by the icon button
                            IconButton(
                              icon: Icon(Icons.close,
                                  color: Colors.black.withOpacity(.7)),
                              onPressed: () {
                                Navigator.pop(context);

                              },
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            editNoteIcon(),
                            SizedBox(
                              height: 90,
                            ),
                            editNoteIcon(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
