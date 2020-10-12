import 'package:flutter/material.dart';
import 'package:my_reflectly/components/daily_positives/custom_chip.dart';
import 'file:///C:/Users/Taku/AndroidStudioProjects/my_reflectly/lib/components/daily_positives/daily_positives_clipper.dart';
import 'package:my_reflectly/providers/daily_positives_provider.dart';
import 'package:provider/provider.dart';

class DailyPositivesDraggable extends StatefulWidget {
  DailyPositivesObject dailyPositivesObject;

  DailyPositivesDraggable({
    this.dailyPositivesObject,
  });

  @override
  _DailyPositivesDraggableState createState() =>
      _DailyPositivesDraggableState();
}

class _DailyPositivesDraggableState extends State<DailyPositivesDraggable> {
  @override
  Widget build(BuildContext context) {
    ShowDailyPositivesDialog showDraggable =
        Provider.of<ShowDailyPositivesDialog>(context);

    String imageName = widget.dailyPositivesObject.imageName;
    String title = widget.dailyPositivesObject.title;
    List<String> tagList = widget.dailyPositivesObject.tagList;
    String authorName = widget.dailyPositivesObject.authorName;
    String passage = widget.dailyPositivesObject.passage;
    String authorDescription = widget.dailyPositivesObject.authorDescription;
    double opacity = widget.dailyPositivesObject.opacity;

    return Dismissible(
      key: ValueKey('hero'),
      direction: DismissDirection.down,
      onDismissed: (direction) {
        print(direction);
        showDraggable.toggleDailyPositivesDialog();
      },
      dismissThresholds: {
        DismissDirection.down: .2,
      },
      child: DraggableScrollableSheet(
          minChildSize: .9,
          initialChildSize: .9,
          maxChildSize: .9,
          builder: (BuildContext context, ScrollController scrollController) {
            double screenWidth = MediaQuery.of(context).size.width;
            double screenheight = MediaQuery.of(context).size.height;



            return ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: screenWidth,
                height: screenheight * .9,
                decoration: BoxDecoration(
                    color: Color(0xffefefef),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: [
                          ClipPath(
                            clipper: DailyPositivesClipper(

                            ),

                            child: Container(
                              height: screenheight * .8,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30))),
                              child: Image.asset(
                                '$imageName',
                                fit: BoxFit.fitHeight,

                              ),
                            ),

                          ),
                          Transform.translate(
                            offset: Offset(
                              screenWidth * .07,
                              screenheight * .47,
                            ),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(1000),
                                  ),
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 5,
                                      style: BorderStyle.solid)),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showDraggable
                                            .toggleDailyPositivesDialog();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenheight * .05,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text(
                                title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: screenheight * .02,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    height: 50,
                                    child: Wrap(
                                      spacing: 5,
                                      runSpacing: 5,
                                      children: tagList.map((e) => CustomChip(text:e)).toList()
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenheight * .15,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Transform.translate(
                        offset: Offset(0, -135),
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$authorName',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                authorDescription,
                                style: TextStyle(
                                  color: Colors.black26,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                passage,
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
