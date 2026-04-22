import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildSettingsItem extends StatelessWidget {
  const BuildSettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.r),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isLogout 
                      ? Colors.red.withOpacity(0.1) 
                      : Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  icon, 
                  color: isLogout ? Colors.redAccent : Colors.purpleAccent,
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp, 
                    color: isLogout ? Colors.redAccent : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios, 
                color: Colors.white24, 
                size: 14.sp
              ),
            ],
          ),
        ),
      ),
    );
  }
}