import 'package:flutter/material.dart';

class AppFonts {
  static const primaryFontFamily = 'PraxisNext';
}

class AppFontSizes {
  static const xxxSmall = 10.0;
  static const xxSmall = 12.0;
  static const xSmall = 13.0;

  static const small = 14.0;

  static const normal = 22.0;
  static const mediumSmall = 24.0;
  static const medium = 17.0;

  static const large = 28.0;
  static const xLarge = 35.0;
  static const xxLarge = 40.0;
  static const xxxLarge = 70.0;

  static const appHeader = xxLarge;
  static const appTitle = large;
  static const appSubTitle = small;
  static const appContent = xSmall;
  static const appFooter = xxSmall;
  static const authTitle = xxxLarge;
  static const planTitle = large;
  static const planPrice = small;
  static const appButton = large;
  static const inputText = large;
}

class AppTextStyles {
  static const inputHintText = TextStyle(
    height: 1.6,
    fontSize: AppFontSizes.normal,
    color: AppColors.hintText,
  );
  static const inputText = TextStyle(
    height: .6,
    fontSize: AppFontSizes.normal,
    color: AppColors.text,
  );

  static const appTitleLarge = TextStyle(
      fontSize: AppFontSizes.large,
      fontWeight: FontWeight.bold,
      color: AppColors.white);

  static const appContentLarge = TextStyle(
      fontSize: AppFontSizes.large,
      fontWeight: FontWeight.normal,
      color: AppColors.white);

  static const appButton = TextStyle(
    fontSize: AppFontSizes.large,
    fontWeight: FontWeight.normal,
    color: AppColors.text,
  );

  static const alertDialogTitle = TextStyle(
      fontSize: AppFontSizes.appTitle,
      fontWeight: FontWeight.w600,
      color: AppColors.white);

  static const alertDialogContent = TextStyle(
    fontSize: AppFontSizes.medium,
    color: AppColors.white,
  );

  static const appBarTitle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.black);

  static const appHeader = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppFontSizes.appHeader,
    color: AppColors.primary,
  );

  static const appTitleSemiBold = TextStyle(
      fontSize: AppFontSizes.appTitle,
      fontWeight: FontWeight.w500,
      color: AppColors.white);
  static const appDrawerTitle = TextStyle(
      fontSize: AppFontSizes.medium,
      color: AppColors.white);

  static const appCountryTitle = TextStyle(
      fontSize: AppFontSizes.medium,
      fontWeight: FontWeight.normal,
      color: AppColors.black);

  static const appContentTitle = TextStyle(
      fontSize: AppFontSizes.medium,
      fontWeight: FontWeight.normal,
      color: AppColors.black);

  static const appContentBold = TextStyle(
      fontSize: AppFontSizes.medium,
      fontWeight: FontWeight.bold,
      color: AppColors.white);
  static const appContentMedium = TextStyle(
      fontSize: AppFontSizes.small,
      fontWeight: FontWeight.w500,
      color: AppColors.black);

  static const offline = TextStyle(
      fontSize: AppFontSizes.small,
      fontWeight: FontWeight.normal,
      color: AppColors.red);

  static const appListTitle = TextStyle(
      fontSize: AppFontSizes.medium,
      fontWeight: FontWeight.w500,
      color: Colors.white);
}

class AppThemes {
  static final appTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      fontFamily: AppFonts.primaryFontFamily,
      textTheme: textDefault,
      primaryColor: AppColors.primary,
      primarySwatch: AppColors.primaryAppSwatch,
      splashColor: AppColors.primary.withOpacity(0.4),
      //appBarTheme: AppThemes.appBar,
      buttonTheme:
          const ButtonThemeData(focusColor: Color.fromARGB(255, 168, 46, 37)));
  static const appBar = AppBarTheme(
    backgroundColor: AppColors.appBarBackgroundColor,
    elevation: AppElevations.appBar,
    iconTheme: appBarIcon,
    titleTextStyle: AppTextStyles.appBarTitle,
  );
  static const appBarIcon = IconThemeData(
    color: AppColors.appBarTitle,
  );

  static var textDefault = const TextTheme(
    bodyLarge: TextStyle(),
    bodyMedium: TextStyle(),
    displayLarge: TextStyle(),
  ).apply(
    bodyColor: AppColors.text,
    fontFamily: 'ProximaNova',
    displayColor: AppColors.text,
  );
}

class AppButtonStyles {
  static final appButton = TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    backgroundColor: AppColors.primary,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static final appBorderButton = TextButton.styleFrom(
    foregroundColor: Colors.white24,
    backgroundColor: Colors.white24,
    elevation: AppElevations.zero,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.small),
        side: const BorderSide(color: AppColors.primary, width: 1)),
  );
  static final appButtonDisabled = TextButton.styleFrom(
    foregroundColor: AppColors.disabledBtn,
    backgroundColor: AppColors.disabledBtn,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static final appRoundButton = TextButton.styleFrom(
    foregroundColor: AppColors.primaryAccent,
    backgroundColor: AppColors.primary,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: const StadiumBorder(),
  );
  static final appRoundButtonDisabled = TextButton.styleFrom(
    backgroundColor: AppColors.hintText,
    elevation: AppElevations.appButton,
    foregroundColor: AppColors.primaryAccent,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: const StadiumBorder(),
  );
  static final alertDialogPositive = TextButton.styleFrom(
    foregroundColor: AppColors.red,
    backgroundColor: AppColors.red,
    elevation: AppElevations.appButton,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.small),
    ),
  );
  static final alertDialogNegative = TextButton.styleFrom(
    elevation: AppElevations.appButton,
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.white,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.small),
    ),
  );
  static final alertDialogNegativeDark = TextButton.styleFrom(
    elevation: AppElevations.appButton,
    backgroundColor: AppColors.disabledBtn,
    foregroundColor: AppColors.disabledBtn,
    padding: const EdgeInsets.all(AppPaddings.zero),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.small),
    ),
  );
}

class AppColors {
  static const primary = Colors.blue; // Color(0xFF2A5BA3);
  static const primaryDark =
      Color.fromARGB(221, 94, 93, 93); // Color(0xFF184990);
  static const primaryAccent = Color.fromARGB(255, 53, 53, 53);
  static const secondary = Colors.red; // Color(0xFFF15A35);
  static const darkText = Color.fromARGB(255, 161, 161, 161);
  static const text = Colors.black;
  static const hintText = Color(0xFF909090);
  static const dropShadow = Color.fromARGB(0, 0, 0, 0);

  static const divider = Color(0xFFAFAFAF);
  static const cardBg = Color(0xFFF5F8FF);
  static const cardBorder = Color(0xFFE5EEFF);
  static const inputLightBorder = Color.fromRGBO(255, 255, 255, 0);
  static const inputBg = Color.fromARGB(255, 44, 44, 44);
  static const inputBgSelected = Color.fromRGBO(255, 255, 255, 0.3);

  static const border = Color(0xFFE0E0E0);
  static const negativeBtn = Color(0xFF565656);
  static const textContent = Colors.black;
  static const textSubtitle =  Colors.black;
  static const primaryAppSwatch = MaterialColor(0xffE32525, color);
  static const scaffoldBackgroundColor = Colors.white;
  static const white = Colors.white;
  static const black = Colors.black;
  static const red = Color(0xffE32525);
  static const green = Color(0xff00A96C);
  static const shadow = Color.fromRGBO(41, 41, 41, 0.8);
  static const appBarBackgroundColor = Colors.white;
  static const appFocusColor = Colors.white60;
  static const appListFocusColor = Color(0xff2B2B2B);
  static const dialogActionBg = Color(0xff37474f);
  static const btn = primary;
  static const disabledBtn = Color(0xFFA9A3A3);
  static const navBar = Color(0xff007B9E);
  static const focusBtnColor = Color(0xff010a0e);

  static const color = {
    50: Color.fromRGBO(28, 117, 178, .1),
    100: Color.fromRGBO(28, 117, 178, .2),
    200: Color.fromRGBO(28, 117, 178, .3),
    300: Color.fromRGBO(28, 117, 178, .4),
    400: Color.fromRGBO(28, 117, 178, .5),
    500: Color.fromRGBO(28, 117, 178, .6),
    600: Color.fromRGBO(28, 117, 178, .7),
    700: Color.fromRGBO(28, 117, 178, .8),
    800: Color.fromRGBO(28, 117, 178, .9),
    900: Color.fromRGBO(28, 117, 178, 1),
  };

  static const Color shimmerBaseColor = Color(0xffF0F1F4);
  static const Color shimmerHighlightColor = Color(0xffDBDFE9);
  static const appBarTitle = text;
}

class AppSpacings {
  static const zero = 0.0;
  static const xxSmall = 4.0;
  static const xSmall = 8.0;
  static const small = 12.0;
  static const medium = 24.0;
  static const xMedium = 20.0;
  static const xxMedium = 15.0;
  static const xxLarge = 30.0;
  static const xxxLarge = 54.0;
  static const logoSpaceTop = 84.0;
}

class AppPaddings {
  static const zero = 0.0;
  static const xxxSmall = 3.0;
  static const xxSmall = 5.0;
  static const xSmall = 8.0;
  static const small = 12.0;
  static const medium = 15.0;
  static const mediumX = 18.0;
  static const large = 20.0;
  static const xLarge = 24.0;
  static const xxLarge = 30.0;
  static const xxxLarge = xxLarge;
  static const defaultSmall = 28.34;
  static const defaultLarge = 57.0;

  static const appBarDefault = xxLarge;
  static const inputTextVertical = 6.0;
  static const inputTextHorizontal = medium;
  static const authContent = xxxLarge;
  static const onBoardingContent = xxxLarge;
  static const alertDialog = large;
  static const otpContent = 40.0;
  static const otpInputPadding = xxLarge;
}

class AppElevations {
  static const zero = 0.0;

  static const appButton = 3.0;
  static const appBar = zero;
}

class AppSizes {
  static const appButton = 230.0;
  static const appButtonHeight = 60.0;
  static const dialogButtonHeight = 42.0;
  static const appBarHeight = 80.0;
  static const appBackButton = 46.0;
  static const logoHeight = 100.0;
  static const logoWidth = 180.0;
  static const alertDialog = 320.0;
  static const bottomNavigationIconSize = 24.0;
}

class AppRadii {
  static double zero = 0.0;
  static const xxSmall = 3.0;
  static const xSmall = 10.0;
  static const small = 15.0;
  static const medium = 20.0;
  static const large = 30.0;
}

class AppBorders {
  static final appBarInputText = OutlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      borderSide: const BorderSide(color: Color(0xffD0D0D0), width: 1));

  static const appInputText = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.border, width: 1),
  );
/* static final inputText = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppRadii.inputText),
    borderSide: const BorderSide(
      color: AppColors.inputTextBorder,
      width: 2.0,
    ),
  );
  static final inputTextDark = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppRadii.inputText),
    borderSide: const BorderSide(
      color: AppColors.inputTextBorderDark,
      width: 2.0,
    ),
  );*/
}

class AppShadows {
  static final shadow = BoxShadow(
    color: AppColors.shadow.withOpacity(0.08),
    blurRadius: 10,
    offset: const Offset(0, 0),
  );
}
