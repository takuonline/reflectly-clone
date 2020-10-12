import 'package:flutter/material.dart';
import 'package:my_reflectly/components/add_note/add_note_pageview.dart';

class ShowDailyPositivesDialog with ChangeNotifier {
  bool _showDailyPositivesDialog = false;
  bool get showDailyPositivesDialog => _showDailyPositivesDialog;

  void toggleDailyPositivesDialog() {
    _showDailyPositivesDialog = !_showDailyPositivesDialog;
    notifyListeners();
  }
}

class DailyPositivesObject {
  DailyPositivesObject(
      {this.imageName,
      this.title,
      this.tagList,
      this.authorName,
      this.authorImage,
      this.authorDescription,
      this.passage,
      this.opacity});

  String imageName;
  String title;
  List<String> tagList;
  String authorName;
  String authorImage;
  String authorDescription;
  String passage;
  double opacity;
}

class DailyPositivesList with ChangeNotifier {
  List<DailyPositivesObject> _dailyPositivesList = [
    DailyPositivesObject(
        imageName: 'images/fall.jpg',
        title: 'You can improve your relationships by writing',
        tagList: ['RELATIONSHIPS', 'SELF-IMPROVEMENT', 'PSYCHOLOGY RESEARCH'],
        authorName: 'TAKUDZWA M.',
//      authorImage: ,
        opacity: .1,
        authorDescription: 'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
        passage: ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
            ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
            'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut ,'),
    DailyPositivesObject(
        imageName: 'images/avenue.jpg',
        title: 'Can journaling make you healthier?',
        tagList: ['RELATIONSHIPS', 'SELF-IMPROVEMENT', 'PSYCHOLOGY RESEARCH'],
        authorName: 'TAKUDZWA M.',
//      authorImage: ,
        opacity: .4,
        authorDescription: 'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
        passage: ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
            ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
            'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut ,'),
    DailyPositivesObject(
        imageName: 'images/dandelion.jpg',
        title: 'Writig is a unique way to explore your mind',
        tagList: ['RELATIONSHIPS', 'SELF-IMPROVEMENT', 'PSYCHOLOGY RESEARCH'],
        authorName: 'TAKUDZWA M.',
//      authorImage: ,
        opacity: .2,
        authorDescription: 'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
        passage: ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
            ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
            'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut ,'),
    DailyPositivesObject(
        imageName: 'images/italy.jpg',
        title: 'improve your daily moments with these 3 tips',
        tagList: ['RELATIONSHIPS', 'SELF-IMPROVEMENT', 'PSYCHOLOGY RESEARCH'],
        authorName: 'TAKUDZWA M.',
//      authorImage: ,
        opacity: .4,
        authorDescription: 'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
        passage: ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
            ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
            'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut ,'),
    DailyPositivesObject(
        imageName: 'images/mountain.jpg',
        title: 'What the words you use say about you',
        tagList: ['RELATIONSHIPS', 'SELF-IMPROVEMENT', 'PSYCHOLOGY RESEARCH'],
        authorName: 'TAKUDZWA M.',
//      authorImage: ,
        opacity: .1,
        authorDescription: 'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
        passage: ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
            ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
            'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut ,'),
    DailyPositivesObject(
        imageName: 'images/road.jpg',
        title: 'What it means to work with yourself through writing',
        tagList: ['RELATIONSHIPS', 'SELF-IMPROVEMENT', 'PSYCHOLOGY RESEARCH'],
        authorName: 'TAKUDZWA M.',
//      authorImage: ,
        opacity: .1,
        authorDescription: 'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
        passage: ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
            ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
            'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut ,'),
    DailyPositivesObject(
        imageName: 'images/yellowstone.jpg',
        title: 'How writing improves you working memory',
        tagList: ['RELATIONSHIPS', 'SELF-IMPROVEMENT', 'PSYCHOLOGY RESEARCH'],
        authorName: 'TAKUDZWA M.',
//      authorImage: ,
        opacity: .2,
        authorDescription: 'IN-HOUSE PSYCHOLOGIST - 3 MINUTE READ',
        passage: ' Lorem ipsum dolor sit amet, consectetur\n\n adipiscing elit.'
            ' Etiam consequat malesuada magna. Interdum et malesuada fames ac ante ipsum primis in faucibus.\n\n Praesent ante neque, porta eget turpis id, semper dictum turpis. Morbi iaculis mauris mi, vel auctor ipsum interdum vel. Proin mollis massa qu\n\nis dui tempus, in accumsan orci fermentum. A\n\nliquam gravida velit vitae pretium bibendum. Aliquam vel ex bibendum, ultrices risus vitae, blandit nisi.'
            'Curabitur feugiat\n\n metus a neque posuere elementum. Donec placerat sodales elementum. Vestibulum lobortis ullamcorper purus, eget malesuada elit aliquet vitae. Curabitur ut tellus dignissim, porttit\n\nor lacus a, porttitor purus. Mauris fermentum arcu magna, ac cursus justo faucibus euismod. Pellentesque vel lobortis metus. Vivamus conse\n\nquat posuere pharetra. Phasellus tempus nibh enim, ut ,')
  ];

  List<DailyPositivesObject> get dailyPositivesList {
    return [..._dailyPositivesList];
  }
}
