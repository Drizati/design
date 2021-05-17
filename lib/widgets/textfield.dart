import 'package:flutter/material.dart';

class DUITextField extends StatefulWidget {
  DUITextField(
      {required this.color,
      required this.icon,
      required this.placeholder,
      required this.validator});
  final Color color;
  final IconData icon;
  final placeholder;
  final Function(
    String? value,
    Function error,
    Function success,
    Function message,
  ) validator;
  @override
  _DUITextFieldState createState() => _DUITextFieldState(color: this.color);
}

class _DUITextFieldState extends State<DUITextField> {
  _DUITextFieldState({required this.color});
  Color color;
  final _textController = TextEditingController();
  final GlobalKey<FormFieldState> _textFormKey = GlobalKey<FormFieldState>();

  // bool _isFormValid() => _textFormKey.currentState!.isValid;

  

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  _error(String? message, Color? newColor, BuildContext context) {
    getColor() {
      if (newColor != null)
        return newColor;
      else
        return Theme.of(context).errorColor;
    }

    setState(() {
      this.color = getColor();
    });

    return message;
  }

  _success(String? message, Color? newColor, BuildContext context) {
    getColor() {
      if (newColor != null)
        return newColor;
      else
        return Colors.lightGreenAccent;
    }

    setState(() {
      this.color = getColor();
    });

    return message;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 283,
      child: TextFormField(
        controller: _textController,
        key: _textFormKey,
        onChanged: (value) {
          setState(() {
            _textFormKey.currentState!.validate();
          });
        },
        validator: (value) => widget.validator(
          value,
          (String message, Color? newColor) =>
              _error(message, newColor, context),
          (String message, Color? newColor) =>
              _success(message, newColor, context),
          (String message) => message,
        ),
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          color: color,
          fontFamily: "HK Grotesk",
          height: 1.5,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: color,
              width: 3,
            ),
          ),
          hintText: widget.placeholder,
          hintStyle: TextStyle(
            color: color,
            fontFamily: "HK Grotesk",
            height: 1.5,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: color,
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: color,
              width: 3,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: color,
              width: 3,
            ),
          ),
          prefixIcon: Icon(
            widget.icon,
            size: 21,
            color: color,
          ),
          suffixIcon: GestureDetector(
            onTap: _changeVisibility(),
            child: Icon(
              _visibilityIcon,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
