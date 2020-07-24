import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BootomBar extends StatefulWidget {
  BootomBar({Key key}) : super(key: key);

  @override
  _BootomBarState createState() => _BootomBarState();
}

class _BootomBarState extends State<BootomBar> {

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    int _currentIndex = 0;
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: WillPopScope(child: Scaffold(
         appBar: AppBar(),
        body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(color: Colors.blueGrey,),
            Container(color: Colors.red,),
            Container(color: Colors.green,),
            Container(color: Colors.blue,),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Item One'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Item One'),
            icon: Icon(Icons.apps)
          ),
          BottomNavyBarItem(
            title: Text('Item One'),
            icon: Icon(Icons.chat_bubble)
          ),
          BottomNavyBarItem(
            title: Text('Item One'),
            icon: Icon(Icons.settings)
          ),
        ],
      ),
        //  bottomNavigationBar: CurvedNavigationBar(
        //    height: 50.0,
        //   color: Colors.orange,
        //   backgroundColor: Colors.white10,
        //   buttonBackgroundColor: Colors.white ,
        //   items: <Widget>[
        //     Icon(Icons.add, size: 20),
        //     Icon(Icons.list, size: 20),
        //     Icon(Icons.compare_arrows, size: 20),
        //   ],
        //   onTap: (index) {
        //     //Handle button tap
        //   },
        // ),

       ), 
       onWillPop: _backPressed)
    );
  }
   Future<bool> _backPressed() {

     setState(() {
      //  _currentIndex=0;
      if(_currentIndex == 0){
         return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Exit'),
              content: Text('You are going to Exit!!'),
              actions: <Widget>[
                FlatButton(
                  child: Text('NO',style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('YES',style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            );
          });

      }else{
        setState(() {
          _currentIndex = 0;
          _pageController.jumpToPage(_currentIndex);
        });
      }
     });
   
  }
}