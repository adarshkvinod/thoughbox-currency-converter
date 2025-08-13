import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';

class AmountTextField extends StatefulWidget {
  final String currencyPair; // e.g. "INDUSD"

  const AmountTextField({super.key, required this.currencyPair});

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  final TextEditingController _controller = TextEditingController();


  static Map<String, Widget> prefixIcons = {
    'INR': Text('₹', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'USD': Text('\$', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'EUR': Text('€', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'JPY': Text('¥', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'GBP': Text('£', style: TextStyle(fontSize: 24.sp, color: Colors.white)),

    'CAD': Text('C\$', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'CNY': Text('¥', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'AUD': Text('A\$', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'CHF': Text('Fr', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'RUB': Text('₽', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'BRL': Text('R\$', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'ZAR': Text('R', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'KRW': Text('₩', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'SGD': Text('S\$', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
    'MXN': Text('\$', style: TextStyle(fontSize: 24.sp, color: Colors.white)),
  };

  String get fromCode {
    if (widget.currencyPair.length >= 3) {
      return widget.currencyPair.substring(0, 3);
    }
    return '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPrefixIcon() {
    final icon = prefixIcons[fromCode] ??
        SizedBox(
          width: 24.dp,
          height: 24.dp,
        );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      key: ValueKey(fromCode),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.dp,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.dp),
            border: Border.all(color: AppColors.borderColor),
            color: AppColors.scaffoldBackgroundColor,
          ),
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(fontSize: 18.dp, color: Colors.white),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12.dp, vertical: 16.dp),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Enter amount',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: _buildPrefixIcon(),
              ),
            ),
            cursorColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
