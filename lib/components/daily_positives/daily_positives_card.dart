import 'package:flutter/material.dart';
import 'custom_chip.dart';

class CustomDailyPositivesCard extends StatelessWidget {
  CustomDailyPositivesCard({this.image, this.opacity: .2,this.tagList,this.title,this.passage});
 final  String image;
  final double opacity;
  final List<String> tagList;
  final String title;
  final String passage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          width: 300,
          height: 280,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(
                '$image',
              ),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(opacity), BlendMode.multiply),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 70,
                  width: 270,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: tagList.map((e) => CustomChip(text:e)).toList()
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Transform.translate(

          offset: Offset(15, -60),
          child: Container(
            width: 270,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Text(
                        passage,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
