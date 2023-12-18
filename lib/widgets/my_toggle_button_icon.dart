import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final String initialText;
  final String toggledText;
  final IconData initialIcon;
  final IconData toggledIcon;
  final Color color;
  final Color pressedColor;
  final bool isToggled;
  final Function() onToggle;
  final Function() onPressed;

  const ToggleButton({
    Key? key,
    required this.initialText,
    required this.toggledText,
    required this.initialIcon,
    required this.toggledIcon,
    required this.color,
    required this.pressedColor,
    required this.isToggled,
    required this.onToggle,
    required this.onPressed,
  }) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _isToggled = false;

  @override
  void initState() {
    super.initState();
    _isToggled = widget.isToggled;
  }

  @override
  void didUpdateWidget(ToggleButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isToggled = widget.isToggled;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isToggled) {
          widget.onToggle();
          print("called the disconned method");
          setState(() {
            _isToggled = !_isToggled;
          });
        } else {
          widget.onPressed();
          print("called the connect method ");
          setState(() {
            _isToggled = !_isToggled;
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.38,
        height: 80,
        decoration: BoxDecoration(
            color: _isToggled ? widget.pressedColor : widget.color,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color:
                    Colors.black.withOpacity(0.2), // Shadow color and opacity
                offset: const Offset(0, 4), // Offset of the shadow
                blurRadius: 6, // Spread of the shadow
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isToggled ? widget.initialIcon : widget.toggledIcon,
              size: 25,
              color: _isToggled ? widget.color : widget.pressedColor,
            ),
            const SizedBox(height: 8),
            Text(
              _isToggled ? widget.toggledText : widget.initialText,
              style: TextStyle(
                fontSize: 12,
                color: _isToggled ? widget.color : widget.pressedColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
