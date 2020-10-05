import 'package:flutter/material.dart';
import 'package:flutter_app/detail.dart';
import 'package:flutter_app/sidemenu.dart';
import 'package:hexcolor/hexcolor.dart';

import 'models/book.dart';

void main() {
  runApp(
    MaterialApp(
      home: BookPage(),
    ),
  );
}

class BookPage extends StatefulWidget {
  static const String route = 'book_page';

  BookPage({Key key}) : super(key: key);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  void _openDrawer(){
    _drawerKey.currentState.openDrawer();
  }
  @override
  Widget build(BuildContext context) {
    // A book tile - this will be receiving an instance of a book
    createTile(Book book) => Hero(
          tag: book.title,
          child: Material(
            elevation: 15.0,
            shadowColor: Colors.green,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(book: book),
                  ),
                );
              },
              child: Image(
                image: AssetImage(book.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

    //iterate over books
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            crossAxisCount: 3,
            children: books.map((book) => createTile(book)).toList(),
          ),
        ),
      ],
    );

    //Main Scaffold
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: _drawerKey,
      drawer: SideMenu(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _openDrawer,
          
        ),
        title: Center(child: Text('Available Documents')),
        actions: [Icon(Icons.more_vert)],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Hexcolor("#8DCCB1"),
                Hexcolor("#043e2a"),
              ],
            ),
          ),
        ),
      ),
      body: grid,
    );
  }
}
