import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_bloc2/pages/home/bookmarkpage.dart';
import 'package:practice_bloc2/pages/home/homepage.dart';
import 'package:practice_bloc2/pages/home/ticketpage.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';

class Pagecontrol extends StatefulWidget {
  const Pagecontrol({super.key});

  @override
  State<Pagecontrol> createState() => _PagecontrolState();
}

class _PagecontrolState extends State<Pagecontrol> {
  // page index
  int currentPageIndex = 0;

  final List page = [Homepage(), Bookmarkpage(), Ticketpage()];

  void tapBar(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentPageIndex],
      extendBody: true,
      bottomNavigationBar: CrystalNavigationBar(
        enablePaddingAnimation: true,
        backgroundColor: Colors.grey.shade900,
        onTap: (index) => tapBar(index),
        currentIndex: currentPageIndex,
        items: [
          CrystalNavigationBarItem(
            icon: CupertinoIcons.home,
            selectedColor: Colors.teal.shade800,
            unselectedColor: Colors.white,
          ),
          CrystalNavigationBarItem(
            icon: CupertinoIcons.bookmark_fill,
            selectedColor: Colors.teal.shade800,
          ),

          CrystalNavigationBarItem(
            icon: CupertinoIcons.ticket_fill,
            selectedColor: Colors.teal.shade800,
          ),
        ],
      ),
    );
  }
}
