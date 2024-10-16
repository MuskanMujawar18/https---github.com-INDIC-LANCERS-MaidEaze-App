import 'package:flutter/material.dart';

class ButtonContainer extends StatefulWidget {
  final double? width,
      height,
      start,
      end,
      top,
      bottom,
      circularRadius,
      fontSize;
  final String? text, isCenter;
  final VoidCallback? onPressed;
  final Color? color, borderColor, textColor;
  final bool? status;
  const ButtonContainer(
      {super.key,
      this.width,
      this.height,
      this.text,
      this.isCenter,
      this.onPressed,
      this.color,
      this.start,
      this.end,
      this.top,
      this.bottom,
      this.status,
      this.circularRadius,
      this.borderColor,
      this.textColor,
      this.fontSize});

  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: widget.start!,
          end: widget.end!,
          top: widget.top!,
          bottom: widget.bottom!),
      child: SizedBox(
        height: widget.height! / 15.0,
        width: widget.width!,
        child: TextButton(
          style: ButtonStyle(
            alignment: widget.isCenter != null
                ? Alignment.centerLeft
                : Alignment.center,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(widget.color),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      widget.circularRadius != null &&
                              widget.circularRadius != 0
                          ? widget.circularRadius!
                          : 10.0),
                  side: BorderSide(color: widget.borderColor!)),
            ),
          ),
          onPressed: widget.onPressed,
          child: widget.status == true
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onBackground)
              : Text(widget.text!,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                      color: widget.textColor!,
                      fontSize: widget.fontSize ?? 16,
                      letterSpacing: 0.2,
                      fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
