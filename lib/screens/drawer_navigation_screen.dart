import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/categories_screen.dart';

class DrawerNavigationScreen extends StatefulWidget {
  @override
  _DrawerNavigationScreenState createState() => _DrawerNavigationScreenState();
}

class _DrawerNavigationScreenState extends State<DrawerNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Todoey'),
              accountEmail: Text('Category & Priority based Todo App'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  child: Icon(
                    Icons.playlist_add_check_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 35.0,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
            ListTile(
              title: Text('Tasks'),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.view_list),
              onTap: () {
                Navigator.pushNamed(context, CategoriesScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
