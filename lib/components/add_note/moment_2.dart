import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_reflectly/components/buttons/custom_raised_button.dart';
import 'package:my_reflectly/providers/activities_grid_provider.dart';
import 'package:my_reflectly/providers/isActivitesMoreThanZero.dart';
import 'package:my_reflectly/providers/moment2_provider.dart';
import 'add_note_pageview.dart';

import 'package:provider/provider.dart';

class Moment2 extends StatefulWidget {
  PageController controller;

  Moment2(this.controller,);


  @override
  _Moment2State createState() => _Moment2State();
}

class _Moment2State extends State<Moment2> {
  bool onWillPop() {
    widget.controller.previousPage(
      duration: Duration(milliseconds: 800),
      curve: Curves.linear,
    );
    return false;
  }



  @override
  Widget build(BuildContext context) {
    ActivitiesMoments activitiesMoments = context.watch<ActivitiesMoments>();

    final screenHeight = MediaQuery.of(context).size.height;


//    changeState(){
//      if (context
//          .read<ActivitiesMoments>()
//          .activitiesList
//          .length ==
//          0) {
//        setState(() {
//          widget.isMoreThanZero = false;
//          widget.changeState(false);
//          print('setting is more to false first part');
//        });
//      } else {
//        setState(() {
//          widget.isMoreThanZero = true;
//          widget.changeState(true);
//          print('setting it to true  second part part');
//          print(widget.isMoreThanZero);
//        });
//      }
//    }

    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 25),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Nice!, Whats making your evening pretty good?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Select up to 10 activities',
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
              height: screenHeight * .45,
              child: GridView.builder(
                itemCount:
                    context.watch<GridActivityList>().gridActivityList.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (ctxt, index) {
                  List<ActivitiesGridItem> _itemsList =
                      context.read<GridActivityList>().gridActivityList;
//    WidgetsBinding.instance.addPostFrameCallback((_){

//                    if (context
//                            .read<ActivitiesMoments>()
//                            .activitiesList
//                            .length <
//                        1) {
//                      WidgetsBinding.instance.addPostFrameCallback((_) {
//                        setState(() {
//                          widget.isMoreThanZero = false;
//                        });
//                      });
//                    } else {
//                      WidgetsBinding.instance.addPostFrameCallback((_) {
//                        setState(() {
//                          widget.isMoreThanZero = true;
//                          print('hit  second part part');
//                        });
//                      });
//                    }

//                    Future.delayed(Duration.zero, () async {
//
//                    });

//    });
//        print(context.read<ActivitiesMoments>().activitiesList.length);
                  return GridContainer(
                    title: _itemsList[index].title,
                    icon: _itemsList[index].icon,
                    activitiesMoments: activitiesMoments,
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            )

          ,
        CustomRaisedButton(  controller: widget.controller,btnText: 'Continue', clicked: context.watch<ActivitiesIsMoreThanZero>().activitiesIsMoreThanZero,   )


          ],
        ),
      ),
    );
  }
}

class GridContainer extends StatefulWidget {
  IconData icon;
  String title;
  ActivitiesMoments activitiesMoments;


  GridContainer({
    this.title,
    this.icon,
    this.activitiesMoments,

  });

  @override
  _GridContainerState createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  bool _isTapped = false;

  @override
  void initState() {
    setState(() {
      var lazy = widget.activitiesMoments.activitiesList
          .where((element) => element.title == widget.title);
      if (lazy.length > 0) {
        _isTapped = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.activitiesMoments.activitiesList.length < 1) {

    }
    return GestureDetector(
      onTap: () {


//        // creates the NoteActivity object
        NoteIconsWithNames activity =
            NoteIconsWithNames(title: widget.title, icon: widget.icon);

        // add item to the list
        if (widget.activitiesMoments.activitiesList.length <= 10) {
          widget.activitiesMoments.addActivityMoment(activity);
        }

        // removes item from the list
        if (_isTapped) {
          widget.activitiesMoments.removeActivityMoment(widget.title);
        }

        // turns on and off the bgcolor
        if (widget.activitiesMoments.activitiesList.length <= 10) {
          setState(() {
            _isTapped ? _isTapped = false : _isTapped = true;
          });
        }


// update stae of button and checks whether the list has more than 0 items
        if (widget.activitiesMoments.activitiesList.length < 1){
          context.read<ActivitiesIsMoreThanZero>().toggleActivitiesIsMoreThanZero(false);
        }else{
        context.read<ActivitiesIsMoreThanZero>().toggleActivitiesIsMoreThanZero(true);
        }

        print(context.read<ActivitiesIsMoreThanZero>().activitiesIsMoreThanZero);
        print(widget.activitiesMoments.activitiesList.length);

      },
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: _isTapped ? Colors.white : Color(0xff0093E9),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 5,
                child: Icon(
                  widget.icon,
                  color: _isTapped ? Color(0xff0093E9) : Colors.white,
                  size: 30,
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: 5,
                ),
              ),
              Flexible(
                flex: 2,
                child: FittedBox(
                  child: Text(
                    '${widget.title}',
                    style: TextStyle(
                        fontSize: 14,
                        color: _isTapped ? Color(0xff0093E9) : Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
