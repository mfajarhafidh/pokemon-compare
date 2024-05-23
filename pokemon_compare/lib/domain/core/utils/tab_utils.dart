import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabUtils extends StatelessWidget {
  final int selectedIndex;
  final Function onTap;

  const TabUtils({
    required this.selectedIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          ItemTabbar(
            label: "About",
            isSelected: selectedIndex == 0,
            onTap: () {
              onTap(0);
            },
          ),
          ItemTabbar(
            label: "Base Stats",
            isSelected: selectedIndex == 1,
            onTap: () {
              onTap(1);
            },
          ),
          ItemTabbar(
            label: "Evolution",
            isSelected: selectedIndex == 2,
            onTap: () {
              onTap(2);
            },
          ),
          ItemTabbar(
            label: "Moves",
            isSelected: selectedIndex == 3,
            onTap: () {
              onTap(3);
            },
          ),
        ],
      ),
    );
  }
}

class ItemTabbar extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onTap;

  const ItemTabbar({
    required this.label,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              height: 30.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.blue))),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              height: 30.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          );
  }
}
