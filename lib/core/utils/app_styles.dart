import 'package:elevate_task/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle categoryTitle = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle categoryPrice = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle categoryOfferPrice = GoogleFonts.poppins(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.main.withOpacity(0.6),
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle categoryReview = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
}
