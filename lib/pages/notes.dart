import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:my_reflectly/components/constants.dart';
import 'package:my_reflectly/components/moments/Icon_moment.dart';
import 'package:my_reflectly/components/moments/open_image_draggable.dart';
import 'package:my_reflectly/components/moments/open_note_draggable.dart';
import 'package:my_reflectly/components/navbar/nav_btn.dart';
import 'package:my_reflectly/components/notes/text_note.dart';
import 'package:my_reflectly/components/navbar/navbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_reflectly/providers/show_add_note_provider.dart';
import 'package:my_reflectly/providers/username_provide.dart';

import 'package:provider/provider.dart';

import 'package:my_reflectly/providers/stored_moments_provider.dart';

class Moments extends StatefulWidget {
  static String id = 'Notes';

  bool showAddNote = false;

  Moments({this.showAddNote});

  @override
  _MomentsState createState() => _MomentsState();
}

class _MomentsState extends State<Moments>  with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  Animation<double> _fadeAnimation;
  Animation<Offset>   _slideAnimation;

  Animation<double> _fadeAnimation2;
  Animation<Offset>   _slideAnimation2;

  Animation<double> _fadeAnimation3;
  Animation<Offset>   _slideAnimation3;

  Animation _scaleAnimation;
  Animation<double> _fadeAnimation4;

  ScrollController _hideBottomNavController;

  bool isSelected = false;

  bool showAddNote = false;

  bool showNoteDraggable = false;

  bool _isVisible = false;

  bool addNote = false;

  bool _isDragged = false;

  final SlidableController slidableController = SlidableController();

  @override
  initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),


    );
    _animationController.forward();

    _fadeAnimation =CurvedAnimation(
      curve: Interval(.1, .2, curve: Curves.ease),
      parent: _animationController
    );

    _slideAnimation =  Tween<Offset>(
      begin: Offset(0, .3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(.1, .3, curve: Curves.ease),
    ));


    _fadeAnimation2 =CurvedAnimation(
        curve: Interval(.3, .5, curve: Curves.ease),
        parent: _animationController
    );

    _slideAnimation2 =  Tween<Offset>(
      begin: Offset(.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(.3, .5, curve: Curves.ease),
    ));


    _fadeAnimation3 =CurvedAnimation(
        curve: Interval(.5, .7, curve: Curves.ease),
        parent: _animationController
    );

    _slideAnimation3 =  Tween<Offset>(
      begin: Offset(.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(.5, .7, curve: Curves.ease),
    ));

    _scaleAnimation = CurvedAnimation(
        curve: Interval(.7, .8, curve: Curves.ease),
        parent: _animationController
    );
    _fadeAnimation4 =CurvedAnimation(
        curve: Interval(.7, .8, curve: Curves.ease),
        parent: _animationController
    );




    _isVisible = true;
    _hideBottomNavController = ScrollController();
    _hideBottomNavController.addListener(
      () {
        if (_hideBottomNavController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (_isVisible)
            setState(() {
              _isVisible = false;
            });
        }
        if (_hideBottomNavController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!_isVisible)
            setState(() {
              _isVisible = true;
            });
        }
      },
    );
  }


  @override
  dispose(){
    super.dispose();
    _animationController.dispose();
  }



  Future<void> _showNoteDraggable(IconMoment iconMoment) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return OpenNoteDraggable(draggableItem: iconMoment,);
      },
    );
  }

  Future<void> _showImageDraggable(IconMoment iconMoment,int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return OpenImageDraggable(draggableItem: iconMoment,index: index,);
      },
    );
  }




  Future<void> _showMomentAlertDialog(int index) async {
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
                context.read<StoredMoments>().removeMoment(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  String _determineTimeOfDay() {
    int timeOfDay = DateTime.now().toLocal().hour;

    if (timeOfDay < 12 || timeOfDay==0) {
      return 'morning';
    } else if (timeOfDay < 18) {
      return 'afternoon';
    } else if (timeOfDay < 24) {
      return 'evening';
    } else {
      return 'day';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    isSelected = context.watch<IsPopUpOn>().isPopUpOn;

    String timeOfDay = _determineTimeOfDay();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              controller: _hideBottomNavController,
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: screenHeight / 5.5,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: screenWidth*.1),
                                child: Text(
                                  'Good $timeOfDay,',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff777777), fontSize: 25),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: screenWidth*.1),
                                child: Text(
                                  '${context.watch<UserName>().userName}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff222222),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FadeTransition(
                      opacity: _fadeAnimation2,
                      child: SlideTransition(
                        position: _slideAnimation2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: screenWidth * .9,
                            height: screenHeight / 6.5,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(25))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, left: 15, right: 50),
                              child: Container(
                                width: screenWidth * .7,
                                child: Row(
                                  children: [
                                    Material(
                                      color: Colors.black.withOpacity(.1),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.lock_outline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'DAILY REFLECTION',
                                              style: TextStyle(
                                                  color:
                                                      Colors.black.withOpacity(.3),
                                                  fontSize: 12),
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.black.withOpacity(.3),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          'Self-Love',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:80,
                    ),
                    CustomScrollView(
                      reverse: true,
                      controller: ScrollController(),
                      shrinkWrap: true,
                      slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              List<IconMoment> _providerData =
                                  context.watch<StoredMoments>().items;
                              return

                                _providerData[index].file != null  ?


                                Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 30,top: 30,bottom: 30),
                                      alignment: Alignment.centerRight,
                                      child: FadeTransition(

                                        opacity:  _fadeAnimation4,
                                        child: ScaleTransition(
                                          scale:_scaleAnimation,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: GestureDetector(
                                              onTap:(){
                                                _showImageDraggable(context
                                                    .read<StoredMoments>()
                                                    .items[index],index);
                              },
                                              child: Image.file(
                                                _providerData[index].file,
                                                height: screenHeight/3,
                                                width: screenWidth*.55,
                                                fit: BoxFit.cover,

                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Transform.translate(
                                    offset: Offset(30,50),
                                    child: Icon(
                                        Icons.image,
                                        color: Colors.grey,

                                    ),
                                  )
                                  ]
                                  ,
                                )


                                    :

                                FadeTransition(
                                opacity: _fadeAnimation3,
                                child: SlideTransition(
                                  position: _slideAnimation3,
                                  child:


                                  Slidable(
                                    key: ValueKey('slideItem$index'),
                                    controller: slidableController,
                                    actionPane: SlidableDrawerActionPane(),
                                    actionExtentRatio: 0.25,
                                    child:



                                    GestureDetector(
                                      onTap: () {

                                          _showNoteDraggable(context
                                              .read<StoredMoments>()
                                              .items[index]);

                                      },

                                      child:TextNote(
                                        screenWidth: screenWidth,
                                        screenHeight: screenHeight,
                                        icon: _providerData[index].moodIcon,
                                        title: _providerData[index].title,
                                        activities: _providerData[index].activities,
                                        feelings: _providerData[index].feelings,
                                        notes: _providerData[index].addSomeNotes,
                                        index: index,
                                        isDragged: _isDragged,
                                      ),
                                    ),
                                    secondaryActions: <Widget>[
                                      Container(
                                        child: Center(
                                          child: FlatButton(
                                            onPressed: () {
                                              _showMomentAlertDialog(index);
                                            },
                                            child: Container(
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(15)),
                                              height: 50,
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            childCount:
                                context.watch<StoredMoments>().items.length,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ],
            ),
            Navbar(  isVisible: _isVisible),
            if (isSelected)
              GestureDetector(
                onTap: () => context.read<IsPopUpOn>().togglePopUp(),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  color: Colors.white.withOpacity(.5),
                  width: screenWidth,
                  height: screenHeight,
                ),
              ),
            Navbtn(
              screenheight: screenHeight,
              showAddNote: showAddNote,
            ),

//            if (_showDraggable) draggable(_draggableItem),
//            if (context.watch<AddMoment>().showAddNote) AddNotePageView(),
          ],
        ),
      ),
    );
  }
}

class editNoteIcon extends StatelessWidget {
  const editNoteIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  offset: Offset(2, 5),
                  blurRadius: 20)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.edit,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class activitiesIcon extends StatelessWidget {
  IconData icon;
  activitiesIcon({this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffeeeeee),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Icon(
            icon,
            color: Color(0xffcccccc),
            size: 30,
          ),
        ),
      ),
    );
  }
}

//_getItem(BuildContext context) {
//  return Card(
//    elevation: 3,
//    margin: EdgeInsets.all(8),
//    child: Row(
//      children: <Widget>[
//        Expanded(
//          child: Container(
//            padding: EdgeInsets.all(8),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text(
//                    'Item',
//                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                  ),
//                )
//              ],
//            ),
//          ),
//        ),
//      ],
//    ),
//  );
//}

class floatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
//    canvas.drawCircle(Offset(50,50), 50, Paint());
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.addRRect(RRect.fromLTRBR(size.width, size.height * .1, 0,
        size.height * .72, Radius.circular(25)));

    path.addRRect(RRect.fromLTRBR(size.width * .66666, size.height,
        size.width * .333333, size.height * .6, Radius.circular(20)));

//    path.addRRect(RRect.fromLTRBR(60, 60, size.width, size.height, Radius.circular(20)));

//
//    path.moveTo(0, 0);
////    path.lineTo(0, size.height*.7);
////    path.lineTo(size.width*.3 ,size.height*.7  );
////    path.lineTo(size.width*.3 ,size.height);
////    path.lineTo(size.width*.7 ,size.height);
////    path.lineTo(size.width*.7 ,size.height*.7);
////    path.lineTo(size.width ,size.height*.7);
////    path.lineTo(size.width ,0);
////    path.lineTo(size.width*.5 ,0 );
////    path.close();
////
    canvas.drawPath(path, paint);

//
//

//    canvas.drawDRRect(RRect.fromLTRBR(70, 20, 10, 10, Radius.circular(10)), RRect.fromLTRBR(10, 10, 40, 40,Radius.circular(20)), Paint());

//    path.moveTo(150, 150);
//
//
//    path.quadraticBezierTo(
//        size.width / 2, size.height / 2, size.width, size.height * 0.25);
//    path.lineTo(size.width, 0);
//    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
    throw UnimplementedError();
  }
}
