import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_reflectly/components/daily_positives/daily_positives_card.dart';
import 'package:my_reflectly/components/daily_positives/draggable.dart';
import 'package:my_reflectly/components/navbar/nav_btn.dart';
import 'package:my_reflectly/components/navbar/navbar.dart';
import 'package:my_reflectly/providers/daily_positives_provider.dart';
import 'package:my_reflectly/providers/images_provider.dart';
import 'package:my_reflectly/providers/show_add_note_provider.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';

class DailyPositives extends StatefulWidget {
  static String id = 'DailyPositives';

  @override
  _DailyPositivesState createState() => _DailyPositivesState();
}

class _DailyPositivesState extends State<DailyPositives>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _fadeAnimation;
  Animation<Offset> _slideAnimation;

  bool _isVisible = true;
  bool showDraggable = false;
  bool isSelected = false;
  DailyPositivesObject dailyPositivesObject;
  final StoryController storyController = StoryController();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animationController.forward();

    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.ease);

    _slideAnimation = Tween<Offset>(begin: Offset(0, .4), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));
  }

  Future<void> _showInstaDialog(BuildContext context, String imageUrl) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StoryView(
          controller: storyController,
          storyItems: [
            StoryItem.pageImage(url: imageUrl, controller: storyController),
          ],
          onComplete: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    storyController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    List<DailyPositivesObject> dailyPositivesList =
        Provider.of<DailyPositivesList>(context).dailyPositivesList;

    ShowDailyPositivesDialog showDraggable =
        Provider.of<ShowDailyPositivesDialog>(context);

    List<String> imageList = Provider.of<DPImagesProvider>(context).items;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xffeeeeee),
          child: Stack(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 55, left: 10),
                        child: GestureDetector(
                          onTap: () {
                            print(Provider.of<DPImagesProvider>(context,
                                    listen: false)
                                .items
                                .length);
                          },
                          child: Text(
                            ' Daily Positives',
                            style: TextStyle(
                                fontSize: 50,
                                color: Color(0xffdddddd),
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 90, left: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: imageList
                                .map((e) => GestureDetector(
                                    onTap: () {
                                      print('showing dialog inst');
                                      return _showInstaDialog(context, e);
                                    },
                                    child: DailyPositivesAvatar(
                                      imageUrl: e,
                                    )))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: dailyPositivesList
                        .map((e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  showDraggable.toggleDailyPositivesDialog();
                                  dailyPositivesObject = e;
                                });
                              },
                              child: FadeTransition(
                                opacity: _animationController,
                                child: SlideTransition(
                                  position: _slideAnimation,
                                  child: CustomDailyPositivesCard(
                                    image: '${e.imageName}',
                                    opacity: e.opacity,
                                    tagList: e.tagList,
                                    title: e.title,
                                    passage: e.passage,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  )
                ],
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
              Navbar(isVisible: _isVisible),
              Navbtn(
                screenheight: screenheight,
              ),
              if (showDraggable.showDailyPositivesDialog)
                GestureDetector(
                  onTap: () {
                    showDraggable.toggleDailyPositivesDialog();
                  },
                  child: Container(
                    height: screenheight,
                    width: screenWidth,
                    color: Colors.blue.withOpacity(.3),
                  ),
                ),
              if (showDraggable.showDailyPositivesDialog)
                DailyPositivesDraggable(
                  dailyPositivesObject: dailyPositivesObject,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class DailyPositivesAvatar extends StatelessWidget {
  String imageUrl;
  DailyPositivesAvatar({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CircleAvatar(
        radius: 35,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.blue,
          ),
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red,
            textStyle: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url:
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            caption: "Still sampling",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
