import 'dart:math';

import 'package:flutter/material.dart';

class GuillotineMenu extends StatefulWidget {
  @override
  _GuillotineMenuState createState() => _GuillotineMenuState();
}

class _GuillotineMenuState extends State<GuillotineMenu>
    with SingleTickerProviderStateMixin {
  final GlobalKey _menuIconkey = GlobalKey();

  Animation<double> _menuAnimation;

  Animation<double> _toolbarTitleFadeAnimation;

  AnimationController _guillotineMenuAnimationController;

  @override
  void initState() {
    super.initState();

/*
This is to check the offset of the menu Icon in top left corner.

    // WidgetsBinding.instance.addPostFrameCallback(_getPosition);

*/

    _guillotineMenuAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    )..addListener(() {
        setState(() {});
      });

    _menuAnimation = Tween(begin: -pi / 2, end: 0.0).animate(CurvedAnimation(
        parent: _guillotineMenuAnimationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn));

    _toolbarTitleFadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_guillotineMenuAnimationController);
  }

  _getPosition(_) {
    _getOffset();
  }

  void _getOffset() {
    final RenderBox offsetBox = _menuIconkey.currentContext.findRenderObject();
    final Offset offset = offsetBox.localToGlobal(Offset.zero);
    print("Offset : $offset");
  }

  @override
  void dispose() {
    super.dispose();
    _guillotineMenuAnimationController.dispose();
  }

  void _onMenuIconClick() {
    if (_isMenuVisible()) {
      _guillotineMenuAnimationController.reverse();
    } else {
      _guillotineMenuAnimationController.forward();
    }
  }

  bool _isMenuVisible() {
    final AnimationStatus status = _guillotineMenuAnimationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _menuAnimation.value,
      origin: Offset(32.0, 76.0),
      alignment: Alignment.topLeft,
      child: Material(
        color: Colors.amber,
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _toolbar(),
                ),
                Expanded(
                  flex: 8,
                  child: _menuItems(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _toolbar() {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: <Widget>[_toolbarIcon(), _toolbarTitle()],
        ),
      ),
    );
  }

  Widget _toolbarIcon() {
    return IconButton(
      key: _menuIconkey,
      icon: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      onPressed: () => _onMenuIconClick(),
    );
  }

  Widget _toolbarTitle() {
    return FadeTransition(
      opacity: _toolbarTitleFadeAnimation,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Text(
          "Avengers",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _menuItems() {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Message"),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Message"),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Message"),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Message"),
          )
        ],
      ),
    );
  }
}
