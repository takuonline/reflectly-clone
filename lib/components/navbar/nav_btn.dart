import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_reflectly/components/add_note/show_add_note_draggable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_reflectly/components/moments/Icon_moment.dart';
import 'package:my_reflectly/providers/stored_moments_provider.dart';
import 'package:path/path.dart';

import 'package:provider/provider.dart';

import 'package:my_reflectly/providers/show_add_note_provider.dart';


class Navbtn extends StatefulWidget {
  Navbtn({Key key, @required this.screenheight, this.showAddNote})
      : super(key: key);

  final double screenheight;
//  bool isSelected = false;
  bool showAddNote = false;

  @override
  _NavbtnState createState() => _NavbtnState();
}

class _NavbtnState extends State<Navbtn> with TickerProviderStateMixin {
  Animation<Offset> slideAnimation;
  Animation<double> fadeAnimation;

  Animation<Offset> slideAnimation2;
  Animation<double> fadeAnimation2;



  AnimationController _animationController;


  @override
  void initState() {
    _animationController= AnimationController(
    vsync:  this,
      duration: Duration(seconds: 1)
    );
//    _animationController.forward();


    slideAnimation  = Tween<Offset>(begin: Offset(0, .5), end: Offset.zero)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Interval(.3, .6, curve: Curves.easeOutQuad)));

    fadeAnimation  =
        CurvedAnimation(curve: Interval(.3, .6,curve: Curves.ease ), parent: _animationController);




    slideAnimation2  = Tween<Offset>(begin: Offset(0, .5), end: Offset.zero)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Interval(.6, .9, curve: Curves.easeOutQuad)));

    fadeAnimation2  =
        CurvedAnimation(curve: Interval(.6, .9,curve: Curves.ease ), parent: _animationController);

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _animationController.dispose();

  }

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {

    _isSelected = context.watch<IsPopUpOn>().isPopUpOn;



    if(_isSelected){
//Future.delayed(Duration(seconds: 1));
      _animationController.forward();
    }
    if(!_isSelected){

      _animationController.reset();
    }




    Column showSelectionPopUp( ) {

      return Column(
        children: <Widget>[
          FadeTransition(
            opacity:fadeAnimation,
            child: SlideTransition(
              position: slideAnimation,
              child: NavBarBtnItem(
                title: 'Moment',
                icon: Icons.edit,
                onTap:  () {
                  ShowAddNoteDialog.displayDialog(context);
                  context.read<IsPopUpOn>().togglePopUp();
                },

              ),
            ),
          ),
          FadeTransition(
            opacity: fadeAnimation2,
            child: SlideTransition(
              position: slideAnimation2,
              child: NavBarBtnItem(
                title: 'Photo',
                icon: Icons.image,
                onTap: ()async{
                  context.read<IsPopUpOn>().togglePopUp();
                  final _picker =   ImagePicker();
                   PickedFile _pickedImage = await _picker.getImage(source: ImageSource.gallery);

                   if(_pickedImage != null){
                     final File file  = File(_pickedImage.path);

                     IconMoment iconMoment = IconMoment(
                         file: file
                     );
                     context.read<StoredMoments>().addMoment(iconMoment);

                   }else{
                   print('picked image returned null');
                    }

                },

              ),
            ),
          ),

        ],
      );
    }
    return Hero(
        tag: 'Navbtn',
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOut,
            margin: _isSelected
                ? EdgeInsets.only(bottom: widget.screenheight * .1)
                : EdgeInsets.only(bottom: widget.screenheight * .01),
            width: _isSelected ? 160 : 60,
            height: _isSelected ? 120 : 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.purple,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _isSelected
                  ?
             showSelectionPopUp()
                  : Center(
                      child: GestureDetector(
                        onTap: () {
                          context.read<IsPopUpOn>().togglePopUp();
                        },
                        child: Icon(
                          Icons.add,
                          size: 30,
                        ),
                      ),
                    ),
            ),
          ),
        ));
  }
}

class NavBarBtnItem extends StatelessWidget {
  NavBarBtnItem({
    this.title,
    this.icon,
    this.onTap
  });

 final IconData icon;
 final String title;
 final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GestureDetector(
        onTap: onTap ,
        child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Text(
                title,
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
