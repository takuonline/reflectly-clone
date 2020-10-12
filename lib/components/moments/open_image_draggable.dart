

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_reflectly/components/add_note/add_note_pageview.dart';
import 'package:my_reflectly/components/moments/Icon_moment.dart';
import 'package:my_reflectly/pages/notes.dart';
import 'package:my_reflectly/providers/stored_moments_provider.dart';
import 'package:provider/provider.dart';


class OpenImageDraggable extends StatelessWidget {

  Future<void> _showDeleteImageAlertDialog(int index, BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'ARE YOU SURE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Deleting this element is permanent and you cannot get it back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Icon(
                Icons.close,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onPressed: () {
                print(index);
                context.read<StoredMoments>().removeMoment(index);
                Navigator.of(context).pop();
                Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }



  OpenImageDraggable({this.draggableItem,this.index});
  final IconMoment draggableItem;
  final index;


  @override
  Widget build(BuildContext context) {

    File momentImage =  draggableItem.file;



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
        minChildSize: .95,
        initialChildSize: .95,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;


          return Material(

            color: Colors.transparent,
            child: Container(

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30))),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.center,


                    children: [

                      ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          momentImage,
                          fit: BoxFit.cover,
                          height: screenHeight*.7,
                          width: screenWidth*.8,

                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right:30,
                    child: GestureDetector(
                      onTap: (){
                        _showDeleteImageAlertDialog(index, context);
                      },
                      child: Material(
                        shadowColor: Colors.black,
                        elevation: 2,
                        color: Colors.white,
                       borderRadius:BorderRadius.circular(12),
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Icon(
                           Icons.delete_forever,
                           color:Colors.black,
                           size: 27,
                          ),
                       )
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
            ),
          );
        },
      ),
    );
  }
}
