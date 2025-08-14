import 'package:flutter/material.dart';
import 'package:the_responsive_builder/the_responsive_builder.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_colors.dart';
import 'package:thoughbox_currency_converter/src/presentation/core/constants/app_typography.dart';

class HorizontalSlidingTab extends StatefulWidget {
  final List<String> tabs;
  final ValueChanged<int> onTabChanged;
  final double width;
  final double height;

  const HorizontalSlidingTab({
    super.key,
    required this.tabs,
    required this.onTabChanged,
    this.width = 100, // each tab width
    this.height = 40,
  });

  @override
  State<HorizontalSlidingTab> createState() => _HorizontalSlidingTabState();
}

class _HorizontalSlidingTabState extends State<HorizontalSlidingTab> {
  late ValueNotifier<int> selectedIndexNotifier;

  @override
  void initState() {
    super.initState();
    selectedIndexNotifier = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    selectedIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * widget.tabs.length,
      height: widget.height,
      child: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor, width: 1),
              color: AppColors.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // Sliding highlight
          ValueListenableBuilder<int>(
            valueListenable: selectedIndexNotifier,
            builder: (_, selectedIndex, __) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: selectedIndex * widget.width,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8.dp),
                  ),
                ),
              );
            },
          ),

          // Tab labels
          ValueListenableBuilder<int>(
            valueListenable: selectedIndexNotifier,
            builder: (_, selectedIndex, __) {
              return Row(
                children: List.generate(widget.tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndexNotifier.value = index;
                      widget.onTabChanged(index);
                    },
                    child: SizedBox(
                      width: widget.width,
                      height: widget.height,
                      child: Center(
                        child: Text(
                          widget.tabs[index],
                          style: AppTypography.heading1.copyWith(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
