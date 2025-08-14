import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final bool? obscureText;
  final String? Function(String value)? validator; // <-- Validator callback

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText = 'Enter text',
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;
  bool _hasText = false;
  String _errorMessage = '';
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    widget.controller.addListener(() {
      setState(() {
        _hasText = widget.controller.text.isNotEmpty;
      });
      _runValidation(widget.controller.text);
    });
  }

  void _runValidation(String value) {
    if (widget.validator != null) {
      final error = widget.validator!(value) ?? '';
      if (_errorMessage != error) {
        setState(() {
          _errorMessage = error;
        });
      }
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool animateUp = _isFocused || _hasText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.dp,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(
              color: _errorMessage.isEmpty
                  ? AppColors.borderColor
                  : Colors.redAccent,
            ),
            color: AppColors.scaffoldBackgroundColor,
          ),
          child: Stack(
            children: [
              // Animated hint text
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                left: 12,
                top: animateUp ? 4 : 18,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    color: _errorMessage.isEmpty ? Colors.grey : Colors.redAccent,
                    fontSize: animateUp ? 12 : 16,
                  ),
                  child: Text(widget.hintText),
                ),
              ),

              // Text field
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    focusNode: _focusNode,
                    controller: widget.controller,
                    keyboardType: widget.keyboardType,
                    obscureText: widget.obscureText ?? false,
                    obscuringCharacter: 'X',
                    style: TextStyle(fontSize: 18.dp, color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    ),
                    cursorColor: AppColors.primaryColor,
                    onChanged: (value) {
                      _runValidation(value);
                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        // Animated error message
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: _errorMessage.isEmpty
              ? const SizedBox.shrink()
              : Padding(
            padding: const EdgeInsets.only(top: 4, left: 8),
            child: Text(
              _errorMessage,
              style: const TextStyle(color: Colors.redAccent, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
