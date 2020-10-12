import 'package:flutter/material.dart';
import 'package:my_reflectly/components/account_pageview/account_pageview.dart';
import 'package:my_reflectly/pages/account.dart';


class SettingsPage extends StatefulWidget {
  static String id = "/SettingsPage";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    PageController _controller = PageController(initialPage: 0);

    return PageView(
      controller: _controller,
      physics: NeverScrollableScrollPhysics(),
      children: [Account(_controller), SettingsPage2(_controller)],
    );
  }



}


class SettingsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;

  SettingsCard(this.title, this.subTitle, this.icon);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  color: Colors.black54.withOpacity(.1),
                  size: 100,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 21, color: Colors.black),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(.4)),
                      ),
                    ],
                  ),
                  Switch(
                    value: false,
                    onChanged: (bool value) {},
                    activeColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class SettingsCard2 extends StatelessWidget {
  String text;

  SettingsCard2(this.text);

  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black.withOpacity(.4),
            ),
          )),
        ));
  }
}
