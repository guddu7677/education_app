import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF4334B4);
  static const Color backgroundDark = Color(0xFF4334B4);
  static const Color white = Colors.white;
  static const Color lightGrey = Colors.grey;
  static const Color semiTransparent = Color(0x1A4334B4);
  static const Color greyBorder = Color(0xFFE0E0E0);
  static const Color buttonbackgroundcolor = Color(0x33D70404);
  static const Color iconBGcolor = Color(0XFFF4F6F9);
}

class AppImages {
  static const String background = "assets/images/BG.png";
  static const String profile = "assets/images/rr.png";
  static const String sun = "assets/images/sun.png";
  static const String questionIcon = "assets/images/qq.png";
  static const String mode1 = "assets/images/1p.png";
  static const String mode2 = "assets/images/2p.png";
  static const String mode3 = "assets/images/3p.png";
  static const String mode4 = "assets/images/4p.png";
  static const String mode5 = "assets/images/5p.png";
  static const String mode6 = "assets/images/6p.png";
  static const String mode7 = "assets/images/7p.png";
  static const String mode8 = "assets/images/8p.png";
  static const String image1 = "assets/images/image1.png";
  static const String image2 = "assets/images/image2.png";
  static const String image3 = "assets/images/image3.png";
  static const String lock = "assets/images/lock.png";
  static const String first = "assets/images/first.png";
  static const String second = "assets/images/second.png";
  static const String third = "assets/images/third.png";
  static const String base = "assets/images/Base.png";
    static const String profileinfo = "assets/images/profile.png";
        static const String purchageimages = "assets/images/purchage.png";
                static const String examimage = "assets/images/exam.png";



}

class AppTextStyles {
  static TextStyle white16 = TextStyle(color: Colors.white, fontSize: 16);

  static const TextStyle boldWhite16 = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle boldblack16 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle boldblblack14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle black16 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle colorGrey = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle smallWhite12 = TextStyle(
    color: Colors.white,
    fontSize: 12,
  );
  static const TextStyle smallblack14 = TextStyle(
    color: Colors.black,
    fontSize: 12,
  );
  static const TextStyle smallWhite12bold = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle smallblack12bold = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle smallblack12 = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle primaryBold16 = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}

class AppButtonStyles {
  static final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF4334B4),
    disabledBackgroundColor: const Color(0xFF4334B4).withOpacity(0.4),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    minimumSize: const Size(double.infinity, 50),
  );
}

class appdot {
  static final Container dot10Container = Container(
    height: 10,
    width: 10,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.primary,
      border: Border.all(color: AppColors.primary),
    ),
  );
}
