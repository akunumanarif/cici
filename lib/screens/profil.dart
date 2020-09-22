import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cici/screens/dashboard.dart';

final warnaLatar = Colors.amber.withOpacity(20);

class HalamanProfil extends StatefulWidget {
  static const routeName = '/ResideMenuPage';
  @override
  _HalamanProfilState createState() => _HalamanProfilState();
}

class _HalamanProfilState extends State<HalamanProfil>
    with TickerProviderStateMixin {
  int widgetId = 1;

  MenuController _menuController;

  /// ---------------------------
  /// inilizing controllers and state .
  /// ---------------------------

  @override
  void initState() {
    super.initState();
    _menuController = MenuController(vsync: this);
  }

  /// ---------------------------
  /// Closing controllers for memory leaks .
  /// ---------------------------
  dispose() {
    super.dispose();
    _menuController.dispose();
  }

  double setHeightPercentage(percentage, context) {
    if (percentage <= 100 || percentage > 0)
      return MediaQuery.of(context).size.height * (percentage / 100);
    else
      return MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    double height = setHeightPercentage(100, context);

    /// ---------------------------
    /// Building Scaffold Reside Menu drawer .
    /// ---------------------------

    return ResideMenu.custom(
      decoration: new BoxDecoration(
        /// ---------------------------
        /// Building shaped  background drawer .
        /// ---------------------------

        gradient: LinearGradient(
          colors: <Color>[
            Color(0xf57842),
            Color(0xFF096650),
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
        color: Colors.white.withOpacity(0.5),
      ),
      controller: _menuController,
      leftView: getDrawer(height),

      /// ---------------------------
      /// Building home content.
      /// ---------------------------

      child: new Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: new AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: new GestureDetector(
            child: Container(
              // color: Colors.amber,
              child: const Icon(
                Icons.graphic_eq,
                color: Colors.amber,
              ),
            ),
            onTap: () {
              _menuController.openMenu(true);
            },
          ),
          title: new Text(
            'Cici PetAdopt',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.amber,
                ),
                onPressed: () => {},
              ),
            ),
          ],
        ),
        body: SliderUtama(),
      ),
    );
  }

  /// ---------------------------
  /// Building drawer with helper method.
  /// ---------------------------

  getDrawer(double height) {
    return new Container(
      padding: new EdgeInsets.only(top: height * 0.1),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new ConstrainedBox(
            constraints: new BoxConstraints(maxHeight: 82.0, maxWidth: 82.0),
            child: getHeaderDrawerImage(),
          ),
          new SizedBox(
            height: 16.0,
          ),
          getHeaderText(),
          new SizedBox(
            height: 8.0,
          ),

          /// ---------------------------
          /// Building drawer list items.
          /// ---------------------------

          Expanded(
            child: Container(
              child: new ListView(
                /// ---------------------------
                /// Building list view items for drawer items.
                /// ---------------------------

                physics: const NeverScrollableScrollPhysics(),
                itemExtent: 40.0,
                shrinkWrap: true,
                children: <Widget>[
                  /// ---------------------------
                  /// Building one item  for drawer with helper method.
                  /// ---------------------------

                  getMaterialResideMenuItem(
                      'Home', MaterialCommunityIcons.home_outline, 1),
                  getMaterialResideMenuItem('Profil',
                      MaterialCommunityIcons.account_circle_outline, 2),
                  getMaterialResideMenuItem('Pesan', EvilIcons.envelope, 3),
                  getMaterialResideMenuItem(
                      'Adopsi', SimpleLineIcons.envelope_letter, 4),
                  getMaterialResideMenuItem('Tiket', Foundation.ticket, 5),
                  getMaterialResideMenuItem('Setting', Feather.settings, 6),
                  getMaterialResideMenuItem('Tentang Kami', Icons.error, 7),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black.withOpacity(0.5),
          ),
          Container(
            margin: new EdgeInsets.only(bottom: height * 0.122),
            child: getMaterialResideMenuItemWithCustomColor(Colors.red, 8),
          ),
        ],
      ),
    );
  }

  /// ---------------------------
  /// Building Header Drawer Image  for drawer with helper method.
  /// ---------------------------
  Widget getHeaderDrawerImage() {
    return new CircleAvatar(
      backgroundImage: NetworkImage(
          "https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png"),
      radius: 50.0,
      backgroundColor: Colors.transparent,
    );
  }

  /// ---------------------------
  /// Building Header Drawer Text  for drawer with helper method.
  /// ---------------------------
  getHeaderText() {
    return Text(
      'Halo, Selamat datang Ci',
      maxLines: 1,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        decoration: TextDecoration.none,
      ),
    );
  }

  Material getMaterialResideMenuItemWithCustomColor(
      Color drawerIconColor, int state) {
    String drawerMenuTitle = 'Log in';
    IconData drawerMenuIcon = Feather.log_in;
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        child: ResideMenuItem(
          title: drawerMenuTitle,
          icon: Icon(
            drawerMenuIcon,
            color: drawerIconColor,
          ),
        ),
        onTap: () => {Navigator.of(context).pop()},
      ),
    );
  }

  /// ---------------------------
  /// Changing active state for clicked item.
  /// ---------------------------
  setStateForWidget(int widgetId) {
    if (this.widgetId != widgetId)
      setState(() {
        this.widgetId = widgetId;
      });
    _menuController.closeMenu();
  }

  Material getMaterialResideMenuItem(
      String drawerMenuTitle, IconData drawerMenuIcon, int state) {
    return new Material(
      color: Colors.transparent,
      child: new InkWell(
        onTap: () => {
          setStateForWidget(state),
        },
        child: new Stack(
          children: <Widget>[
            ResideMenuItem(
              title: drawerMenuTitle,
              icon: Icon(
                drawerMenuIcon,
                color: new Color(0xffdddddd),
              ),
            ),
            widgetId == state
                ? Padding(
                    padding: EdgeInsets.only(top: 2, bottom: 2),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        borderRadius: new BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(28),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(28),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

/// ---------------------------
///  Reside Menu Drawer widget goes here.
/// ---------------------------

typedef void OnOpen(bool isLeft);
typedef void OnClose();
typedef void OnOffsetChange(double offset);

enum ScrollDirection { LEFT, RIGHT, BOTH }
enum ScrollState { ScrollToLeft, NONE, ScrollToRight }

class ResideMenu extends StatefulWidget {
  // your content View
  final Widget child;

  //left or right Menu View
  final Widget leftView, rightView;

  //shadow elevation
  final double elevation;

  // it will control the menu Action,such as openMenu,closeMenu
  final MenuController controller;

  // used to set bottom bg and color
  final BoxDecoration decoration;

  final OnOpen onOpen;

  final OnClose onClose;

  final bool enableScale, enableFade, enable3dRotate;

  final OnOffsetChange onOffsetChange;

  ResideMenu.scaffold(
      {@required this.child,
      Widget leftBuilder,
      MenuScaffold leftScaffold,
      MenuScaffold rightScaffold,
      this.decoration: const BoxDecoration(),
      this.elevation: 12.0,
      this.onOpen,
      this.enableScale: true,
      this.enableFade: true,
      this.enable3dRotate: false,
      this.onClose,
      this.onOffsetChange,
      this.controller,
      Key key})
      : assert(child != null),
        leftView = leftScaffold,
        rightView = rightScaffold,
        super(key: key);

  ResideMenu.custom(
      {@required this.child,
      this.leftView,
      this.rightView,
      this.decoration: const BoxDecoration(color: const Color(0xff0000)),
      this.elevation: 12.0,
      this.onOpen,
      this.onClose,
      this.enable3dRotate: false,
      this.enableScale: true,
      this.enableFade: true,
      this.onOffsetChange,
      this.controller,
      Key key})
      : assert(child != null),
        super(key: key);

  @override
  _ResideMenuState createState() => new _ResideMenuState();
}

class _ResideMenuState extends State<ResideMenu>
    with SingleTickerProviderStateMixin {
  //determine width
  double _width = 0.0;
  MenuController _controller;
  ValueNotifier<ScrollState> _scrollState =
      ValueNotifier<ScrollState>(ScrollState.NONE);

  void _onScrollMove(DragUpdateDetails details) {
    double offset = details.delta.dx / _width * 2.0;
    if (_controller.value == 0.0) {
      if (details.delta.dy.abs() > details.delta.dx.abs() ||
          details.delta.dx.abs() < 10) return;
    }
    _controller.value += offset;
  }

  void _onScrollEnd(DragEndDetails details) {
    if (_controller.value > 0.5) {
      _controller.openMenu(true);
    } else if (_controller.value < -0.5) {
      _controller.openMenu(false);
    } else {
      _controller.closeMenu();
    }
  }

  void _handleScrollChange() {
    _scrollState.value = _controller.value == 0.0
        ? ScrollState.NONE
        : _controller.value > 0.0
            ? ScrollState.ScrollToLeft
            : ScrollState.ScrollToRight;
    if (widget.onOffsetChange != null) {
      widget.onOffsetChange(_controller.value.abs());
    }
  }

  void _handleScrollEnd(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_controller.value == 1.0) {
        if (widget.onOpen != null) {
          widget.onOpen(true);
        }
      } else if (_controller.value == -1.0) {
        if (widget.onOpen != null) {
          widget.onOpen(false);
        }
      } else {
        if (widget.onClose != null) {
          widget.onClose();
        }
      }
    }
  }

  @override
  void didChangeDependencies() {
    _update();
    super.didChangeDependencies();
  }

  // update listener
  void _update() {
    final MenuController newController = widget.controller ??
        MenuController(vsync: this, direction: ScrollDirection.LEFT);
    if (newController == null || newController == _controller) return;
    if (_controller != null)
      _controller
        ..removeListener(_handleScrollChange)
        ..removeStatusListener(_handleScrollEnd);
    _controller = newController;
    _controller
      ..addListener(_handleScrollChange)
      ..addStatusListener(_handleScrollEnd);
  }

  @override
  void initState() {
    _scrollState.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollState.dispose();
    _controller
      ..removeListener(_handleScrollChange)
      ..removeStatusListener(_handleScrollEnd);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(ResideMenu oldWidget) {
    _update();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: (context, cons) {
      _width = cons.biggest.width;
      return WillPopScope(
        child: GestureDetector(
          onPanUpdate: _onScrollMove,
          onPanEnd: _onScrollEnd,
          child: new Stack(
            children: <Widget>[
              _scrollState.value != ScrollState.NONE
                  ? new Container(
                      decoration: widget.decoration,
                    )
                  : null,
              _scrollState.value != ScrollState.NONE
                  ? _MenuTransition(
                      offset: _controller,
                      child: new Container(
                          margin: new EdgeInsets.only(
                              left: (_scrollState.value ==
                                      ScrollState.ScrollToRight
                                  ? cons.biggest.width * 0.3
                                  : 0.0),
                              right: (_scrollState.value ==
                                      ScrollState.ScrollToLeft
                                  ? cons.biggest.width * 0.3
                                  : 0.0)),
                          child: _scrollState.value == ScrollState.ScrollToLeft
                              ? widget.leftView
                              : widget.rightView),
                    )
                  : null,
              _ContentTransition(
                  enableScale: widget.enableScale,
                  enable3D: widget.enable3dRotate,
                  child: new Stack(
                    children: <Widget>[
                      Container(
                        child: widget.child,
                        decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: const Color(0xcc000000),
                            offset: const Offset(-2.0, 2.0),
                            blurRadius: widget.elevation * 0.66,
                          ),
                        ]),
                      ),
                      _scrollState.value != ScrollState.NONE
                          ? AnimatedBuilder(
                              animation: _controller,
                              builder: (c, w) {
                                return GestureDetector(
                                  child: Container(
                                    width: cons.biggest.width,
                                    height: cons.biggest.height,
                                    color: new Color.fromARGB(
                                        !widget.enableFade
                                            ? 0
                                            : (125 * _controller.value.abs())
                                                .toInt(),
                                        0,
                                        0,
                                        0),
                                  ),
                                  onTap: () {
                                    _controller.closeMenu();
                                  },
                                );
                              },
                            )
                          : null,
                    ].where((child) => child != null).toList(),
                  ),
                  menuOffset: _controller),
            ].where((child) => child != null).toList(),
          ),
        ),
        onWillPop: () async {
          if (_controller.value != 0) {
            _controller.closeMenu();
            return false;
          }
          return true;
        },
      );
    });
  }
}

class ResideMenuItem extends StatelessWidget {
  final String title;

  final TextStyle titleStyle;

  final Widget icon, right;

  final double height;

  final double midSpacing, leftSpacing, rightSpacing;

  const ResideMenuItem(
      {Key key,
      this.title: "Hello world",
      this.titleStyle: const TextStyle(
          inherit: true, color: const Color(0xffdddddd), fontSize: 15.0),
      this.icon: const Text(""),
      this.right: const Icon(
        Icons.arrow_forward_ios,
        color: const Color(0xffdddddd),
      ),
      this.height: 50.0,
      this.leftSpacing: 15.0,
      this.rightSpacing: 50.0,
      this.midSpacing: 30.0});

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 40.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  icon,
                  Container(
                    width: midSpacing,
                  ),
                  Text(
                    title,
                    style: titleStyle,
                  )
                ],
              ),
              margin: EdgeInsets.only(left: leftSpacing),
            ),
//            Padding(
//              child: right,
//              padding: EdgeInsets.only(right: rightSpacing),
//            )
          ],
        ));
  }
}

class _MenuTransition extends AnimatedWidget {
  final Widget child;

  final Animation<double> offset;

  _MenuTransition({@required this.child, this.offset, Key key})
      : super(key: key, listenable: offset);

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: (context, cons) {
      double width = cons.biggest.width;
      double height = cons.biggest.height;
      final Matrix4 transform = new Matrix4.identity()
        ..scale(2 - offset.value.abs(), 2 - offset.value.abs(), 1.0);
      return Opacity(
        opacity: offset.value.abs(),
        child: new Transform(
            transform: transform,
            child: child,
            origin: new Offset(width / 2, height / 2)),
      );
    });
  }
}

class _ContentTransition extends AnimatedWidget {
  final Widget child;

  final bool enableScale;
  final bool enable3D;

  _ContentTransition(
      {@required this.child,
      @required Animation<double> menuOffset,
      Key key,
      this.enable3D,
      this.enableScale})
      : super(key: key, listenable: menuOffset);

  Animation<double> get menuOffset => listenable;

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: (context, cons) {
      double width = cons.biggest.width;
      double val = menuOffset.value;
      final Matrix4 transform = new Matrix4.identity();
      if (enable3D) {
        transform.setEntry(3, 2, 0.0008);
        transform.rotateY(val * 0.8);
        transform.transposeRotation();
      }
      if (enableScale) {
        transform.scale(1.0 - 0.25 * val.abs(), 1 - 0.25 * val.abs(), 1.0);
      }

      transform.translate(val * 0.8 * width);
      return Transform(
        alignment: Alignment.center,
        transform: transform,
        child: child,
      );
    });
  }
}

class MenuController extends AnimationController {
  bool _isOpenLeft = false;
  bool _isOpenRight = false;

  MenuController(
      {TickerProvider vsync,
      ScrollDirection direction: ScrollDirection.LEFT,
      Duration openDuration: const Duration(milliseconds: 300)})
      : super(
            vsync: vsync,
            lowerBound: direction == ScrollDirection.LEFT ? 0.0 : -1.0,
            upperBound: direction == ScrollDirection.RIGHT ? 0.0 : 1.0,
            duration: openDuration,
            value: 0.0);

  Future<void> openMenu(bool left) {
    return animateTo(left ? 1.0 : -1.0).then((_) {
      _isOpenLeft = left;
    });
  }

  Future<void> closeMenu() {
    return animateTo(0.0).then((_) {
      _isOpenLeft = false;
      _isOpenRight = false;
    });
  }

  bool get isOpenLeft => _isOpenLeft;

  bool get isOpenRight => _isOpenLeft;

  bool get isClose => !_isOpenLeft && !_isOpenRight;
}

class MenuScaffold extends StatelessWidget {
  final List<Widget> children;
  final Widget header;
  final Widget footer;
  final double itemExtent;
  final double topMargin;

  MenuScaffold(
      {Key key,
      @required this.children,
      this.topMargin: 100.0,
      Widget header,
      Widget footer,
      this.itemExtent: 40.0})
      : assert(children != null),
        header = header ?? new Container(height: 20.0),
        footer = footer ?? new Container(height: 20.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: this.topMargin),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          header,
          new ListView(
            physics: const NeverScrollableScrollPhysics(),
            //  itemExtent: this.itemExtent,
//            shrinkWrap: true,
            children: children,
          ),
          footer,
        ],
      ),
    );
  }
}
