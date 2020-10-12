//import 'package:flutter/material.dart';
////import 'package:flutter_slidable/flutter_slidable.dart';
////
////
////
////
////
////
//////class AddNote   {
//////
//////  bool showAddNote = false;
//////
//////  AddNote({this.showAddNote});
//////
//////
//////
//////  Dismissible draggable() {
//////    return Dismissible(
//////      key: ValueKey('hero'),
//////      direction: DismissDirection.down,
//////      onDismissed: (direction) {
////////        if(direction == down)
//////        print(direction);
//////
//////        showAddNote = false;
//////
//////      },
//////      dismissThresholds: {
//////        DismissDirection.down: .2,
//////      },
//////      child: DraggableScrollableSheet(
//////          minChildSize: .9,
//////          initialChildSize: .9,
//////          maxChildSize: 1,
//////          builder: (BuildContext context, ScrollController scrollController) {
//////            double screenWidth = MediaQuery.of(context).size.width;
//////            double screenheight = MediaQuery.of(context).size.height;
//////
//////            scrollController.addListener(() {
//////              if (scrollController.position.atEdge) {
//////                if (scrollController.position.pixels == 0) {
//////                  print(scrollController);
//////
//////
////////                    _showDraggable =false;
//////
//////                } else {
//////                  // you are at bottom position
//////                }
//////              }
//////            });
//////
//////            return Container(
//////                width: screenWidth,
//////                height: screenheight * .9,
//////                decoration: BoxDecoration(
//////                    color: Colors.teal,
//////                    borderRadius:
//////                    BorderRadius.vertical(top: Radius.circular(30))),
//////                child: SingleChildScrollView(
//////                  controller: scrollController,
//////                  child: Padding(
//////                    padding: const EdgeInsets.symmetric(
//////                        horizontal: 30, vertical: 20),
//////                    child: Column(
//////                      children: <Widget>[
//////                        Align(
//////                          alignment: Alignment.topLeft,
//////                          child: IconButton(
//////                            onPressed: () {
//////
//////                              showAddNote = false;
//////
//////                            },
//////                            icon: Icon(
//////                              Icons.close,
//////                              color: Colors.white,
//////                              size: 30,
//////                            ),
//////                          ),
//////                        ),
//////                        SizedBox(
//////                          height: screenheight * .15,
//////                        ),
//////                        Text(
//////                          'You can improve your relationships by writing',
//////                          style: TextStyle(
//////                            color: Colors.white,
//////                            fontSize: 25,
//////                          ),
//////                        ),
//////                        SizedBox(
//////                          height: screenheight * .03,
//////                        ),
//////                        Align(
//////                          alignment: Alignment.centerLeft,
//////                          child: SizedBox(
//////                            height: 40,
//////                            child: Wrap(
//////                              children: <Widget>[
//////
//////                              ],
//////                            ),
//////                          ),
//////                        ),
//////                        SizedBox(
//////                          height: screenheight * .15,
//////                        ),
//////                        Column(
//////                          crossAxisAlignment: CrossAxisAlignment.start,
//////                          children: <Widget>[
//////                            Text(
//////                              'JEANETTE M',
//////                              style: TextStyle(
//////                                color: Colors.white,
//////                              ),
//////                            ),
//////                            SizedBox(
//////                              height: 7,
//////                            ),
//////                            Text(
//////                              'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
//////                              style: TextStyle(
//////                                color: Colors.black,
//////                              ),
//////                            ),
//////                            SizedBox(
//////                              height: 20,
//////                            ),
//////                            Text(
//////                              ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
//////                                  ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
//////                                  'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut facilisis lorem dapibus non. Aliquam tristique iaculis mattis. Aliquam nec ipsum fermentum, ornare lectus non, egestas tortor. Vestibulum varius molestie dapibus.'
//////                                  'Morbi et bibendum arcu. Cras lorem nibh, lacin\n\nia sit amet diam eu, vestibulum auct\n\nor purus. Praesent vitae mi ut leo tempor ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras blandit justo non rhoncus venenatis. Sed porttit\n\nor nibh metus, sed vulputate u\n\nrna dapibus sed. Praesent ullamcorper tempor augue sed tempus. Fusce nec velit sit amet turpis iaculis consectetur. Nullam pretium blandit efficitur.',
//////                              style: TextStyle(
//////                                color: Colors.white,
//////                              ),
//////                            ),
//////                          ],
//////                        )
//////                      ],
//////                    ),
//////                  ),
//////                ));
//////          }),
//////    );
//////  }
//////
//////
//////
//////}
////
//
//
//
//
//class AddNote extends StatefulWidget {
//
//   bool showAddNote = false;
//
//  AddNote({this.showAddNote});
//
//
//  @override
//  _AddNoteState createState() => _AddNoteState();
//}
//
//class _AddNoteState extends State<AddNote> {
//
////  Dismissible Draggable() {
////    return Dismissible(
////      key: ValueKey('hero'),
////      direction: DismissDirection.down,
////      onResize: () {
////        setState(() {
////          showAddNote = false;
////          Navigator.pop(context);
////        });
////      },
////      onDismissed: (direction) {
//////        if(direction == down)
////        print(direction);
////        setState(() {
////          showAddNote = false;
////          Navigator.pop(context);
////        });
////      },
////      dismissThresholds: {
////        DismissDirection.down: .2,
////      },
////      child: DraggableScrollableSheet(
////          minChildSize: .9,
////          initialChildSize: .9,
////          maxChildSize: 1,
////          builder: (BuildContext context, ScrollController scrollController) {
////            double screenWidth = MediaQuery.of(context).size.width;
////            double screenheight = MediaQuery.of(context).size.height;
////
////            scrollController.addListener(() {
////              if (scrollController.position.atEdge) {
////                if (scrollController.position.pixels == 0) {
////                  print(scrollController);
////                  setState(() {
////
////                    showAddNote=false;
////                    Navigator.pop(context);
////                  });
////                } else {
////                  // you are at bottom position
////                }
////              }
////            });
////
////            return Slidable(
////              actionPane: SlidableDrawerActionPane(),
////              actionExtentRatio: 0.25,
////              direction:Axis.vertical ,
////              closeOnScroll: true,
////              key: ValueKey('key'),
////
////              actions: <Widget>[
////                Container(
////                  color: Colors.red,
////                  height: 100,
////                  width: 100,
////                ),
////
////              ],
////              child: Container(
////                  width: screenWidth,
////                  height: screenheight * .9,
////                  decoration: BoxDecoration(
////                      color: Colors.teal,
////                      borderRadius:
////                      BorderRadius.vertical(top: Radius.circular(30))),
////                  child: Slidable(
////                    actionPane: SlidableDrawerActionPane(),
////                    actionExtentRatio: 0.25,
//////                    direction:Axis.vertical ,
////                    closeOnScroll: true,
////                    key: ValueKey('key'),
////
////                    actions: <Widget>[
////                      Container(
////                        color: Colors.red,
////                        height: 100,
////                        width: 100,
////                      ),],
////                    child: SingleChildScrollView(
////                      controller: scrollController,
////                      child: Padding(
////                        padding: const EdgeInsets.symmetric(
////                            horizontal: 30, vertical: 20),
////                        child: Column(
////                          children: <Widget>[
////                            Align(
////                              alignment: Alignment.topLeft,
////                              child: IconButton(
////                                onPressed: () {
////                                  setState(() {
////                                    showAddNote = false;
////                                  });
////                                },
////                                icon: Icon(
////                                  Icons.close,
////                                  color: Colors.white,
////                                  size: 30,
////                                ),
////                              ),
////                            ),
////                            SizedBox(
////                              height: screenheight * .15,
////                            ),
////                            Text(
////                              'You can improve your relationships by writing',
////                              style: TextStyle(
////                                color: Colors.white,
////                                fontSize: 25,
////                              ),
////                            ),
////                            SizedBox(
////                              height: screenheight * .03,
////                            ),
////                            Align(
////                              alignment: Alignment.centerLeft,
////                              child: SizedBox(
////                                height: 40,
////                                child: Wrap(
////                                  children: <Widget>[
////
////                                  ],
////                                ),
////                              ),
////                            ),
////                            SizedBox(
////                              height: screenheight * .15,
////                            ),
////                            Column(
////                              crossAxisAlignment: CrossAxisAlignment.start,
////                              children: <Widget>[
////                                Text(
////                                  'JEANETTE M',
////                                  style: TextStyle(
////                                    color: Colors.white,
////                                  ),
////                                ),
////                                SizedBox(
////                                  height: 7,
////                                ),
////                                Text(
////                                  'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
////                                  style: TextStyle(
////                                    color: Colors.black,
////                                  ),
////                                ),
////                                SizedBox(
////                                  height: 20,
////                                ),
////                                Text(
////                                  ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
////                                      ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
////                                      'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut facilisis lorem dapibus non. Aliquam tristique iaculis mattis. Aliquam nec ipsum fermentum, ornare lectus non, egestas tortor. Vestibulum varius molestie dapibus.'
////                                      'Morbi et bibendum arcu. Cras lorem nibh, lacin\n\nia sit amet diam eu, vestibulum auct\n\nor purus. Praesent vitae mi ut leo tempor ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras blandit justo non rhoncus venenatis. Sed porttit\n\nor nibh metus, sed vulputate u\n\nrna dapibus sed. Praesent ullamcorper tempor augue sed tempus. Fusce nec velit sit amet turpis iaculis consectetur. Nullam pretium blandit efficitur.',
////                                  style: TextStyle(
////                                    color: Colors.white,
////                                  ),
////                                ),
////                              ],
////                            )
////                          ],
////                        ),
////                      ),
////                    ),
////                  )),
////            );
////          }),
////    );
////  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Dismissible(
//      key: ValueKey('hero'),
//      direction: DismissDirection.down,
//      onDismissed: (direction) {
//        print(direction);
//        setState(() {
//          widget.showAddNote = false;
//        });
//      },
//      dismissThresholds: {
//        DismissDirection.down: .2,
//      },
//      child: DraggableScrollableSheet(
//          minChildSize: .9,
//          initialChildSize: .9,
//          maxChildSize: 1,
//          builder: (BuildContext context, ScrollController scrollController) {
//            double screenWidth = MediaQuery.of(context).size.width;
//            double screenheight = MediaQuery.of(context).size.height;
//
//            scrollController.addListener(() {
//              if (scrollController.position.atEdge) {
//                if (scrollController.position.pixels == 0) {
//                  print(scrollController);
//                  setState(() {
//
//                    widget.showAddNote =false;
//                  });
//                } else {
//                  // you are at bottom position
//                }
//              }
//            });
//
//            return Slidable(
//              actionPane: SlidableDrawerActionPane(),
//              actionExtentRatio: 0.25,
//              direction:Axis.vertical ,
//              closeOnScroll: true,
//              key: ValueKey('key'),
//
//              actions: <Widget>[
//                Container(
//                  color: Colors.red,
//                  height: 100,
//                  width: 100,
//                ),
//
//              ],
//              child: Container(
//                  width: screenWidth,
//                  height: screenheight * .9,
//                  decoration: BoxDecoration(
//                      color: Colors.teal,
//                      borderRadius:
//                      BorderRadius.vertical(top: Radius.circular(30))),
//                  child: Slidable(
//                    actionPane: SlidableDrawerActionPane(),
//                    actionExtentRatio: 0.25,
////                    direction:Axis.vertical ,
//                    closeOnScroll: true,
//                    key: ValueKey('key'),
//
//                    actions: <Widget>[
//                      Container(
//                        color: Colors.red,
//                        height: 100,
//                        width: 100,
//                      ),],
//                    child: SingleChildScrollView(
//                      controller: scrollController,
//                      child: Padding(
//                        padding: const EdgeInsets.symmetric(
//                            horizontal: 30, vertical: 20),
//                        child: Column(
//                          children: <Widget>[
//                            Align(
//                              alignment: Alignment.topLeft,
//                              child: IconButton(
//                                onPressed: () {
//                                  setState(() {
//
//                                    widget.showAddNote = false;
////                                    Navigator.pop(context);
//
////                                    isSelected = false;
//
//                                  });
//                                },
//                                icon: Icon(
//                                  Icons.close,
//                                  color: Colors.white,
//                                  size: 30,
//                                ),
//                              ),
//                            ),
//                            SizedBox(
//                              height: screenheight * .15,
//                            ),
//                            Text(
//                              'You can improve your relationships by writing',
//                              style: TextStyle(
//                                color: Colors.white,
//                                fontSize: 25,
//                              ),
//                            ),
//                            SizedBox(
//                              height: screenheight * .03,
//                            ),
//                            Align(
//                              alignment: Alignment.centerLeft,
//                              child: SizedBox(
//                                height: 40,
//                                child: Wrap(
//                                  children: <Widget>[
//
//                                  ],
//                                ),
//                              ),
//                            ),
//                            SizedBox(
//                              height: screenheight * .15,
//                            ),
//                            Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Text(
//                                  'JEANETTE M',
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 7,
//                                ),
//                                Text(
//                                  'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
//                                  style: TextStyle(
//                                    color: Colors.black,
//                                  ),
//                                ),
//                                SizedBox(
//                                  height: 20,
//                                ),
//                                Text(
//                                  ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
//                                      ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
//                                      'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut facilisis lorem dapibus non. Aliquam tristique iaculis mattis. Aliquam nec ipsum fermentum, ornare lectus non, egestas tortor. Vestibulum varius molestie dapibus.'
//                                      'Morbi et bibendum arcu. Cras lorem nibh, lacin\n\nia sit amet diam eu, vestibulum auct\n\nor purus. Praesent vitae mi ut leo tempor ultrices. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras blandit justo non rhoncus venenatis. Sed porttit\n\nor nibh metus, sed vulputate u\n\nrna dapibus sed. Praesent ullamcorper tempor augue sed tempus. Fusce nec velit sit amet turpis iaculis consectetur. Nullam pretium blandit efficitur.',
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                  ),
//                                ),
//                              ],
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
//                  )),
//            );
//          }),
//    );
//  }
//}
