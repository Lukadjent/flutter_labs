import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: 100.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset('assets/yt_logo_dark.png'),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.cast),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (context) => MyAnimation()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () async {
            var res = await Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Search page'),
                  ),
                  body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'On development...',
                            style: TextStyle(fontSize: 24),
                          ),
                          TextButton(
                            onPressed: () =>
                            {Navigator.pop(context, 'Data from page')},
                            child: Column(
                              children: const <Widget>[
                                Text(
                                  'Back with data',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                );
              },
            ));
            print(res as String);
          },
        ),
        Hero(
            tag: "avatar",
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(0))),
              child: CircleAvatar(
                foregroundImage: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/147/147144.png'),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    CustomPageRoute((AvatarScreen())));
              },
            )
        ),
      ],
    );
  }
}

class AvatarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Hero(
              tag: "avatar",
              child: Expanded(
                flex: 1,
                child: Container(
                  height: 400,
                  child:
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/147/147144.png"),
                    ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPageRoute<T> extends PageRoute<T> {
  final Widget child;

  CustomPageRoute(this.child);

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class AnimatedContainer extends AnimatedWidget {
  const AnimatedContainer({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  static final _widthTween = Tween<double>(begin: 200, end: 200);
  static final _heightTween = Tween<double>(begin: 200, end: 300);
  static final _colorTween = ColorTween(begin: Colors.green, end: Colors.pinkAccent);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: _colorTween.evaluate(animation),
                  height: _heightTween.evaluate(animation),
                  width: _widthTween.evaluate(animation),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(animation: animation),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
