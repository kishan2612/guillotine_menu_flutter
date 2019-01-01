import 'package:flutter/material.dart';
import 'package:guillotine_menu_flutter/guillotineMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Guillotine menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: viewContainer,
    );
  }

  Widget viewContainer(BuildContext context, BoxConstraints boxconstraints) {
    return Stack(
      children: <Widget>[

        _backView(context),
        GuillotineMenu()

      ],
    );
  }


  Widget _backView(BuildContext context){
    return Scaffold(
     
      body: Container(
        child: Center(
          child: Text("Hello World"),
        ),
      ),
    );

  }
}
