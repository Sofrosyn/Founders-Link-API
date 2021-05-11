import 'package:flutter/material.dart';
import 'package:founderslink/utils/ui/fab_bottom_app_bar.dart';
import 'package:founderslink/utils/ui/fab_with_icons.dart';
import 'package:founderslink/utils/ui/layout.dart';

import 'package:founderslink/view/pages/Home.dart';
import 'package:founderslink/view/pages/chatHomepage.dart';
import 'package:founderslink/view/pages/companies.dart';
import 'package:founderslink/view/pages/people.dart';
import 'package:founderslink/view/pages/resource.dart';

class Chat extends StatefulWidget {
  Chat({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatState createState() => new _ChatState();
}

class _ChatState extends State<Chat> with TickerProviderStateMixin {
  // String _lastSelected = 'TAB: 0';
  int selectedpage = 0;
  final _pageOptions = [
    ChatHomePage(),
    Companies(),
    Home(),
    People(),
    Resource()
  ];

  void _selectedTab(int index) {
    setState(() {
      selectedpage = index;
    });
  }

  void _selectedFab(int index) {
    setState(() {
      selectedpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: _pageOptions[selectedpage],
      // Center(
      //   child: Text(
      //     _lastSelected,
      //     style: TextStyle(fontSize: 32.0),
      //   ),
      // ),
      bottomNavigationBar: FABBottomAppBar(
        // centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Colors.black,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.textsms_outlined, text: "chats"),
          FABBottomAppBarItem(iconData: Icons.business, text: "companies"),
          FABBottomAppBarItem(iconData: Icons.people, text: "people"),
          FABBottomAppBarItem(iconData: Icons.grid_on, text: "resources"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: 60,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: 'FounderLink',
          child: ImageIcon(
            AssetImage(
              'assets/images/logoIcon.png',
            ),
            size: 50,
          ),
          elevation: 2.0,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}