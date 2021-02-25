import 'package:curved_drawer/curved_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///  adding  curvedDrawer to Scaffold  drawer
      drawer: CurvedDrawer(
        color: Colors.blue,
        width: 300,
        /// build your Drawer Widget
        child: buildDrawerWidget(),
      ),
      appBar: AppBar(
        title: Text('Home Page '),
      ),
      body: Center(
        child: buildLogo(),
      ),
    );
  }

  Widget buildDrawerWidget() {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            buildLogo(),
            SizedBox(height: 80),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.error),
              title: Text('About'),
            ),
          ],
        ),
      ),
    );
  }

  SvgPicture buildLogo() {
    return SvgPicture.network(
      'https://www.pharous.com/assets/site/img/logo.svg',
      width: 200,
      // color: Colors.white,
    );
  }
}
