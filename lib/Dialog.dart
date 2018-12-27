import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'FirstScreen.dart';

class DialogCustom extends StatefulWidget {
  final Kitten kitten;

  DialogCustom(this.kitten);

  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogCustom> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _startAnimation();
  }

  Future _startAnimation() async {
    try {
      await _controller.forward().orCancel;
      // await _controller.reverse().orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  Widget build(BuildContext context) {
    return AnimatedDialog(
      kitten: widget.kitten,
      controller: _controller
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }
}

class AnimatedDialog extends StatelessWidget {
  final Kitten kitten;
  final controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<double> rotate;

  AnimatedDialog({Key key, this.kitten, this.controller})
    : opacity = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.fastOutSlowIn,
        ),
      ),
      width = Tween<double>(
        begin: 50.0,
        end: 300.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.4,
            0.8,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
      height = Tween<double>(
        begin: 50.0,
        end: 350.0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.4,
            0.8,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
      rotate = Tween<double>(
        begin: 0.0,
        end: 3.141 * 2,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.1,
            0.6,
            curve: Curves.ease,
          )
        )
      ),
      super(key: key);

  Future _handleCancel(context) async {
    await controller.reverse().orCancel;
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Center(
          child: Container(
            transform: Matrix4.identity()..rotateZ(rotate.value),
            width: width.value,
            height: height.value,
            child: Opacity(
              opacity: opacity.value,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0,
                          spreadRadius: 10.0,
                          offset: Offset(0, -10)
                        )
                      ],
                    ),
                    child: Image.network(
                      kitten.imageUrl,
                      fit: BoxFit.fill,
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          kitten.name,
                          style: localTheme.textTheme.display1,
                        ),
                        Text(
                          '${kitten.age} year old',
                          style: localTheme.textTheme.subhead.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          kitten.description,
                          style: localTheme.textTheme.body1.copyWith(
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.wavy,
                            fontSize: 15.5,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Wrap(
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    _handleCancel(context);
                                  },
                                  child: const Text('T\'M ALLERGIC'),
                                ),
                                RaisedButton(
                                  onPressed: () {},
                                  child: const Text('ADOPT'),
                                )
                              ]
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        );
      }
    );
  }
}