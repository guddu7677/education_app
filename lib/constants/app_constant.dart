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
  static const Color subtilecolor = Color(0xFF212121);
  static const Color redColor = Colors.red;
  static const Color balcksemibColor = Color(0xFF212121);
}

class BackGroundColor {
  static const Color white = Colors.white;
}

class BorderColor {
  static const Color borderPrimary = Color(0xFF4334B4);
}

class ButtonBackgroundColor {
  static const Color buttonBackgroundColor = Color(0xFF4334B4);
}

class GreenBorder {
  static const Color greenBorder = Colors.green;
}

class RedBordersidecolor {
  static const Color redBorderdSide = Colors.red;
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
  static const String bookimage = "assets/images/book.png";
  static const String primiumImage = "assets/images/primium.png";
  static const String settingImage = "assets/images/setting.png";
  static const String calenderImage = "assets/images/gp.png";
}

class AppTextStyles {
  static TextStyle white16 = TextStyle(color: Colors.white, fontSize: 16);

  static const TextStyle boldWhite16 = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle semiboldWhite16 = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle boldblack16 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle semiboldblack18 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
   static const TextStyle boldblack18 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle boldWhite18 = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle boldblblack14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle boldblblack22 = TextStyle(
    color: Colors.black,
    fontSize: 22,
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
  static const TextStyle semilWhite12 = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w600,
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
  static const TextStyle White20bold = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle semiboldWhite20 = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle semiboldblack20 = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle White14bold = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle black14normal = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle semiblack14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w600,
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
  static const TextStyle subtile14black2121 = TextStyle(
    color: Color(0xFF212121),
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );
  static const TextStyle smibold16black2121 = TextStyle(
    color: Color(0xFF212121),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle primaryBold16 = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle primarysemiBold16 = TextStyle(
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
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

class BottomNavButton {
  static final SafeArea bottomButton = SafeArea(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4334B4),
            disabledBackgroundColor: const Color(0xFF4334B4).withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            "submit",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
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
