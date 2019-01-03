import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guillotine_menu_flutter/guillotineMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Guillotine Menu',
      theme: ThemeData(         
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  statusBarColor: Color.fromRGBO(39, 32, 48, 1.0), //or set color with: Color(0xFF0000FF)
));
    return Scaffold(
     
      body: Container(
        child: Center(
          child: Text("Hello World",
          style: TextStyle(
            fontSize: 32.0
          ),),
        ),
      ),
    );

  }
}
