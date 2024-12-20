import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const FilterButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16.r),
      label: Text(label, style: TextStyle(fontSize: 14.sp)),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        side: const BorderSide(color: Colors.brown),
      ),
    );
  }
}
