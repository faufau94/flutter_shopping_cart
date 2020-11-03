import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_flutter_app/Notifier/manage-fav.dart';
import 'package:my_flutter_app/my-shopping-cart.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => ManageFav(),
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        "/shopping_cart": (context) => MyShoppingCart()
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> list;


  @override
  Widget build(BuildContext context) {

    ManageFav manageFav = Provider.of<ManageFav>(context);

    list = List<Widget>.generate(manageFav.getLengthCard, (index) {

      return GestureDetector(
          onTap: () {print("Item $index");},
          child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Item $index"),
                  IconButton(
                      icon: Icon( manageFav.mapFavCard[index] ? Icons.favorite : Icons.favorite_border_outlined, color: Colors.red),
                      tooltip: "Mettre en favoris",
                      onPressed: () {
                        manageFav.mapFavCard[index] == false ? manageFav.addFav(index) : manageFav.removeFav(index);
                      }
                  )
                ],
              )
          )
      );
    });

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
              Navigator.pushNamed(context,"/shopping_cart");
            })
          ],),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: list
        )
    );
  }
}
