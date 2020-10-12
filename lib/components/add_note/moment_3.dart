import 'package:flutter/material.dart';
import 'package:my_reflectly/components/buttons/custom_raised_button.dart';

import 'package:my_reflectly/providers/add_note_providers.dart';
import 'package:my_reflectly/providers/isFeelingsMoreThanZero.dart';
import 'package:provider/provider.dart';

import 'add_note_pageview.dart';

class Moment3 extends StatefulWidget {

  PageController controller;
  List <NoteIconsWithNames> feelings;

  Moment3(this.controller, this.feelings);

  @override
  _Moment3State createState() => _Moment3State();
}



class _Moment3State extends State<Moment3> {
  bool onWillPop() {
    widget.controller.previousPage(
      duration: Duration(milliseconds: 800),
      curve: Curves.linear,
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {

    bool clicked = true;
    final  screenHeight= MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Text(
              'Nice!, Whats making your evening pretty good?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Select up to 10 feelings',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(
                    .4,
                  ),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: screenHeight*.45,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 3,
//                      padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,

                children: <Widget>[
                  GridContainer(title: 'happy',icon: Icons.tag_faces, feelings:widget.feelings),
                  GridContainer(title: 'sad',icon: Icons.mood_bad, feelings:widget.feelings),
                  GridContainer(title: 'work',icon: Icons.work, feelings:widget.feelings),
                  GridContainer(title: 'love',icon: Icons.favorite, feelings:widget.feelings),
                  GridContainer(title: 'lucky',icon: Icons.star_border, feelings:widget.feelings),
                  GridContainer(title: 'sleepy',icon: Icons.hotel, feelings:widget.feelings),
                  GridContainer(title: 'spiritual',icon: Icons.accessibility, feelings:widget.feelings),
                  GridContainer(title: 'neutral',icon: Icons.sentiment_neutral, feelings:widget.feelings),
                  GridContainer(title: 'very unhappy',icon: Icons.sentiment_very_dissatisfied, feelings:widget.feelings),
                  GridContainer(title: 'ok-ish',icon: Icons.sentiment_satisfied, feelings:widget.feelings),

                  GridContainer(title: 'sleepy_2',icon: Icons.hotel, feelings:widget.feelings),
                  GridContainer(title: 'spiritual_2',icon: Icons.accessibility, feelings:widget.feelings),
                  GridContainer(title: 'neutral_2',icon: Icons.sentiment_neutral, feelings:widget.feelings),
                  GridContainer(title: 'very unhappy_2',icon: Icons.sentiment_very_dissatisfied, feelings:widget.feelings),
                  GridContainer(title: 'ok-ish_2',icon: Icons.sentiment_satisfied, feelings:widget.feelings),

                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomRaisedButton(  controller: widget.controller,btnText: 'Continue', clicked: context.watch<FeelingsIsMoreThanZero>().feelingsIsMoreThanZero,   ),
          ],
        ),
      ),
    );
  }
}

class GridContainer extends StatefulWidget {

  IconData icon;
  String title;
  int count;
  List <NoteIconsWithNames> feelings;

  GridContainer({this.title:'work',this.icon:Icons.work,this.count,this.feelings});



  @override
  _GridContainerState createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  bool _isTapped = false;

  @override
  void initState() {
    setState(() {
      var lazy = widget.feelings.where((element) => element.title == widget.title);
      if (lazy.length>0){
        _isTapped=true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
        
        NoteIconsWithNames activity= NoteIconsWithNames(title: widget.title,icon: widget.icon);
        var mySet = <NoteIconsWithNames>{};
        if ( !_isTapped && widget.feelings.length < 11){
          widget.feelings.add(activity);
        }
//          for (var item in widget.activities){
//            mySet.add(item);
//          }
//
//          widget.activities = mySet.toList();
        if(_isTapped){
          widget.feelings.removeWhere((item) => item.title==widget.title);
        }


        if (widget.feelings.length <11){
          setState(() {
            _isTapped? _isTapped=false: _isTapped=true;
          });
        }

        if (widget.feelings.length < 1){
          context.read<FeelingsIsMoreThanZero>().toggleFeelingsIsMoreThanZero(false);
        }else{
          context.read<FeelingsIsMoreThanZero>().toggleFeelingsIsMoreThanZero(true);
        }


        print(context.read<FeelingsIsMoreThanZero>().feelingsIsMoreThanZero);







        print(widget.feelings.length);
      },
      child: Container(

        decoration: BoxDecoration(
            color:  _isTapped? Colors.white : Color(0xff0093E9),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: 13),
          child: Column(
            children: <Widget>[
              Icon(
                widget.icon,
                color: _isTapped? Color(0xff0093E9): Colors.white,
                size: 30,
              ),
              SizedBox(
                height: 5,
              ),
              FittedBox(
                child: Text(
                  '${widget.title}',
                  style: TextStyle(
                      fontSize: 14,
                      color: _isTapped? Color(0xff0093E9): Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
