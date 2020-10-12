
import 'package:flutter/material.dart';
import 'package:my_reflectly/components/networking/image_network.dart';


// provides images to be used in the Daily positives

class DPImagesProvider with ChangeNotifier {
  List<String> _items = [];

  List<String> get items {
    return [..._items];
  }

  void fillUpList()  async{
    DailyPositivesImageGet imageGet = DailyPositivesImageGet(count: 7,searchQuery: 'nature');

      dynamic imageData =await imageGet.getImg();

      for (var i=0;i<7;i++ ){
        _items.add(imageData['results'][i]['urls']['small']);
      }

    print('filling up list');
    print('the list now has ${items.length}');

    notifyListeners();

  }


}