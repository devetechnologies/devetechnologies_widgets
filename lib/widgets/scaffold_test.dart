import 'package:devetechnologies_widgets/widgets/screen_test.dart';
import 'package:flutter/material.dart';

class ScaffoldTest extends StatefulWidget {
  const ScaffoldTest({Key? key}) : super(key: key);

  @override
  State<ScaffoldTest> createState() => _ScaffoldTestState();
}

class _ScaffoldTestState extends State<ScaffoldTest> {
  int _selectIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOpction = <Widget>[
    Text('Home', style: optionStyle),
    Text('Peoples', style: optionStyle),
    Text('Schoole', style: optionStyle),
    Text('Adminn', style: optionStyle)
  ];

  void _onItemTab(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
        backgroundColor: Colors.deepOrangeAccent[100],
        elevation: 15,
        shadowColor: Colors.orangeAccent,
        actionsIconTheme: const IconThemeData(color: Colors.white, size: 30),
        actions: const [
          /*CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1564398871996174336/M-hffw5a_400x400.jpg'),
          ),*/
          //Icon(Icons.people_alt_outlined),
          Icon(Icons.more_vert),
        ],
        //leading: const Icon(Icons.account_circle_rounded),
        //automaticallyImplyLeading: true,
      ),
      body: Center(
        child: _widgetOpction.elementAt(_selectIndex),
      ),
      drawerScrimColor: Colors.red,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Peoples',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined),
              label: 'School',
              backgroundColor: Colors.orangeAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings),
              label: 'Admin',
              backgroundColor: Colors.blue),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.amberAccent,
        onTap: _onItemTab,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        focusElevation: 300,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const ScreenTest();
          },
        )),
      ),
      /*  bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,*/
      drawer: Drawer(
        //elevation: 20.0,
        // backgroundColor: const Color(0xFF26C6DA),
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Bill Gates"),
              accountEmail: Text("bilgates@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1564398871996174336/M-hffw5a_400x400.jpg'),
                // backgroundColor: Colors.yellow,
                // child: Text("DEV"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ScreenTest();
                  },
                ));
              },
              child: const ListTile(
                title: Text("Inbox"),
                leading: Icon(Icons.mail),
              ),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("Primary"),
              leading: Icon(Icons.inbox),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("Social"),
              leading: Icon(Icons.people),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("Promotions"),
              leading: Icon(Icons.local_offer),
            )
          ],
        ),
      ),
    );
  }
}
