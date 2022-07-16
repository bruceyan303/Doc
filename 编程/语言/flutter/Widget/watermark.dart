/*
 * @Author: bruceyan
 * @Date: 2021-08-25 15:16:58
 * @LastEditTime: 2021-08-25 15:25:20
 * @LastEditors: bruceyan
 * @Description: 
 * @FilePath: \doc\编程\flutter\Widget\watermark.dart
 * 
 */

class Watermark extends StatefulWidget {
  final String wmstr;

  final Widget child;

  Watermark({this.str,required this.child});

  @override
  _WatermarkState createState() = _WatermarkState();
}

class _WatermarkState extends StateWatermark {
  @override
  Widget build(BuildContext context) {
    if (widget.str == null) return widget.child;

    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
            child: Container(
              color: Colors.white.withOpacity(0.3),
              child: FittedBox(
                child: Transform.rotate(
                  angle: -pi / 3,
                  child: Text(widget.str),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}