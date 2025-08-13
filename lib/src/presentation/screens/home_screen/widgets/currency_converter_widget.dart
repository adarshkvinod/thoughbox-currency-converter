import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/widgets/shimmer_placeholder.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_typography.dart';

class CurrencyConverterWidget extends StatefulWidget {
  final bool isLoading;
  final void Function(String from, String to)? onPairChanged;

  const CurrencyConverterWidget({
    super.key,
    this.onPairChanged,
    this.isLoading = false,
  });

  @override
  _CurrencyConverterWidgetState createState() =>
      _CurrencyConverterWidgetState();
}

class _CurrencyConverterWidgetState extends State<CurrencyConverterWidget>
    with TickerProviderStateMixin {
  // final List<Map<String, String>> countries = [
  //   {'flag': '🇺🇸', 'code': 'USD'}, // United States Dollar
  //   {'flag': '🇪🇺', 'code': 'EUR'}, // Eurozone Euro
  //   {'flag': '🇮🇳', 'code': 'INR'}, // Indian Rupee
  //   {'flag': '🇯🇵', 'code': 'JPY'}, // Japanese Yen
  //   {'flag': '🇬🇧', 'code': 'GBP'}, // British Pound
  //   {'flag': '🇨🇦', 'code': 'CAD'}, // Canadian Dollar
  //   {'flag': '🇨🇳', 'code': 'CNY'}, // Chinese Yuan
  //   {'flag': '🇦🇺', 'code': 'AUD'}, // Australian Dollar
  //   {'flag': '🇨🇭', 'code': 'CHF'}, // Swiss Franc
  //   {'flag': '🇷🇺', 'code': 'RUB'}, // Russian Ruble
  //   {'flag': '🇧🇷', 'code': 'BRL'}, // Brazilian Real
  //   {'flag': '🇿🇦', 'code': 'ZAR'}, // South African Rand
  //   {'flag': '🇰🇷', 'code': 'KRW'}, // South Korean Won
  //   {'flag': '🇸🇬', 'code': 'SGD'}, // Singapore Dollar
  //   {'flag': '🇲🇽', 'code': 'MXN'}, // Mexican Peso
  // ];

  late Map<String, String> selectedFrom;
  late Map<String, String> selectedTo;

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  OverlayEntry? _overlayFrom;
  OverlayEntry? _overlayTo;

  late final AnimationController _fromAnimationController;
  late final AnimationController _toAnimationController;

  late final Animation<double> _fromAnimation;
  late final Animation<double> _toAnimation;

  late final AnimationController _rotationController;
  late final Animation<double> _rotationAnimation;

  final LayerLink _fromLayerLink = LayerLink();
  final LayerLink _toLayerLink = LayerLink();

  final GlobalKey _fromKey = GlobalKey();
  final GlobalKey _toKey = GlobalKey();

  static const double _dropdownHeight = 200;

  @override
  void initState() {
    super.initState();

    selectedFrom = AppConstants.countries[2];
    selectedTo = AppConstants.countries[0];

    _fromAnimationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _fromAnimation = CurvedAnimation(
      parent: _fromAnimationController,
      curve: Curves.easeInOut,
    );

    _toAnimationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _toAnimation = CurvedAnimation(
      parent: _toAnimationController,
      curve: Curves.easeInOut,
    );

    // Rotation controller for swap icon
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
    );

    // Notify initial pair on widget load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifyPairChanged();
    });
  }

  @override
  void dispose() {
    _fromAnimationController.dispose();
    _toAnimationController.dispose();
    _rotationController.dispose();
    fromController.dispose();
    toController.dispose();
    _removeOverlay(_overlayFrom);
    _removeOverlay(_overlayTo);
    super.dispose();
  }

  void _removeOverlay(OverlayEntry? overlay) {
    overlay?.remove();
  }

  void swapCountries() {
    setState(() {
      final tempCountry = selectedFrom;
      selectedFrom = selectedTo;
      selectedTo = tempCountry;

      final tempAmount = fromController.text;
      fromController.text = toController.text;
      toController.text = tempAmount;

      _notifyPairChanged();
    });
  }

  void _toggleFromDropdown() =>
      _overlayFrom == null ? _showOverlay(true) : _hideOverlay(true);

  void _toggleToDropdown() =>
      _overlayTo == null ? _showOverlay(false) : _hideOverlay(false);

  void _showOverlay(bool isFrom) {
    final overlay = Overlay.of(context);
    final GlobalKey key = isFrom ? _fromKey : _toKey;
    final selected = isFrom ? selectedFrom : selectedTo;
    final Animation<double> animation = isFrom ? _fromAnimation : _toAnimation;
    final AnimationController controller = isFrom
        ? _fromAnimationController
        : _toAnimationController;

    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final double width = renderBox.size.width;
    final double height = renderBox.size.height;

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy + height,
        width: width,
        child: Material(
          color: Colors.transparent,
          child: FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              alignment: Alignment.topCenter,
              child: _buildDropdownList(selected, (val) {
                setState(() {
                  if (isFrom) {
                    selectedFrom = val;
                    _hideOverlay(true);
                  } else {
                    selectedTo = val;
                    _hideOverlay(false);
                  }
                  _notifyPairChanged();
                });
              }),
            ),
          ),
        ),
      ),
    );

    if (isFrom) {
      _overlayFrom = overlayEntry;
    } else {
      _overlayTo = overlayEntry;
    }

    overlay.insert(overlayEntry);
    controller.forward();
  }

  void _hideOverlay(bool isFrom) {
    final controller = isFrom
        ? _fromAnimationController
        : _toAnimationController;
    controller.reverse().then((_) {
      if (isFrom) {
        _removeOverlay(_overlayFrom);
        _overlayFrom = null;
      } else {
        _removeOverlay(_overlayTo);
        _overlayTo = null;
      }
    });
  }

  void _notifyPairChanged() {
    if (widget.onPairChanged != null) {
      widget.onPairChanged!(
        selectedFrom['code'] ?? '',
        selectedTo['code'] ?? '',
      );
    }
  }

  Widget _buildDropdownList(
    Map<String, String>? selected,
    ValueChanged<Map<String, String>> onSelected,
  ) {
    return Container(
      height: _dropdownHeight.dp,
      margin: EdgeInsets.only(top: 8.dp),
      decoration: BoxDecoration(
        color: const Color(0xFF292929),
        borderRadius: BorderRadius.circular(8.dp),
        boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 8)],
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: AppConstants.countries.map((country) {
          final isSelected = country == selected;
          return ListTile(
            leading: Text(country['flag']!, style: TextStyle(fontSize: 18.sp)),
            title: Text(
              country['code']!,
              style: TextStyle(
                fontSize: 16.dp,
                color: isSelected ? Colors.blueAccent : Colors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            onTap: () => onSelected(country),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDropdownButton(
    Map<String, String>? selected,
    VoidCallback onTap,
    GlobalKey key,
  ) {
    return CompositedTransformTarget(
      link: (key == _fromKey) ? _fromLayerLink : _toLayerLink,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          key: key,
          // width: 150.dp,
          padding: EdgeInsets.symmetric(horizontal: 12.dp, vertical: 8.dp),
          decoration: BoxDecoration(
            color: const Color(0xFF292929),
            borderRadius: BorderRadius.circular(8.dp),
            border: Border.all(color: Colors.grey.shade700),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selected?['flag'] ?? '',
                style: AppTypography.bodyText.copyWith(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
              Gap(8.dp),
              Text(
                selected?['code'] ?? '',
                style: AppTypography.bodyText.copyWith(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF292929),
            Color(0xFF292929),
            Color(0xFF424242),
            Color(0xFF292929),
            Color(0xFF292929),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1B1B1B), Color(0xFF131313)],
          ),
        ),
        child: Column(
          children: [
            widget.isLoading
                ? ShimmerPlaceholder(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60.dp,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.dp),
                            ),
                          ),
                        ),
                        Gap(24.dp),
                        Expanded(
                          child: Container(
                            height: 60.dp,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.dp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Row(
                    children: [
                      // Left dropdown + input
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDropdownButton(
                              selectedFrom,
                              _toggleFromDropdown,
                              _fromKey,
                            ),
                          ],
                        ),
                      ),

                      // Swap button with rotation animation
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.dp),
                        child: IconButton(
                          iconSize: 30.dp,
                          onPressed: () {
                            swapCountries();
                            _rotationController.forward(from: 0);
                          },
                          icon: RotationTransition(
                            turns: _rotationAnimation,
                            child: Image.asset(
                              AppImages.swapIcon,
                              height: 30.dp,
                              color: AppColors.textColorGrey,
                            ),
                          ),
                        ),
                      ),

                      // Right dropdown + input
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDropdownButton(
                              selectedTo,
                              _toggleToDropdown,
                              _toKey,
                            ),
                            // const SizedBox(height: 12),
                            // buildCurrencyInput(toController),
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
