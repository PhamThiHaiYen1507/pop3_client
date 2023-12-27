import 'package:flutter/material.dart';
import 'package:laptrinhmang/styles/text_define.dart';
import 'package:laptrinhmang/styles/theme_model.dart';

const Color primary01 = Color(0xFF321200);
const Color primary02 = Color(0xFF532200);
const Color primary03 = Color(0xFF753400);
const Color primary04 = Color(0xFF9A4600);
const Color primary05 = Color(0xFFD18F61);
const Color primary06 = Color(0xFFDB7531);
const Color primary07 = Color(0xFFFC8F49);
const Color primary08 = Color(0xFFFFB68C);
const Color primary09 = Color(0xFFFFDBC9);

const Color secondary01 = Color(0xFF2B160A);
const Color secondary02 = Color(0xFF432B1D);
const Color secondary03 = Color(0xFF5C4131);
const Color secondary04 = Color(0xFF765847);
const Color secondary05 = Color(0xFF90705E);
const Color secondary06 = Color(0xFFAC8977);
const Color secondary07 = Color(0xFFC8A490);
const Color secondary08 = Color(0xFFE5BFAA);
const Color secondary09 = Color(0xFFFFDBC9);

const Color tertiary01 = Color(0xFF1E1D00);
const Color tertiary02 = Color(0xFF333208);
const Color tertiary03 = Color(0xFF4A481D);
const Color tertiary04 = Color(0xFF626033);
const Color tertiary05 = Color(0xFF7B7949);
const Color tertiary06 = Color(0xFF969360);
const Color tertiary07 = Color(0xFFB1AE78);
const Color tertiary08 = Color(0xFFCCC992);
const Color tertiary09 = Color(0xFFE9E5AB);

const Color error01 = Color(0xFF410002);
const Color error02 = Color(0xFF690005);
const Color error03 = Color(0xFF93000A);
const Color error04 = Color(0xFFBA1A1A);
const Color error05 = Color(0xFFDE3730);
const Color error06 = Color(0xFFFF5449);
const Color error07 = Color(0xFFFF897D);
const Color error08 = Color(0xFFFFB4AB);
const Color error09 = Color(0xFFFFDAD6);

const Color neutral00 = Color(0xFF000000);
const Color neutral01 = Color(0xFF201A17);
const Color neutral02 = Color(0xFF362F2C);
const Color neutral03 = Color(0xFF4D4541);
const Color neutral04 = Color(0xFF655D59);
const Color neutral05 = Color(0xFF7E7571);
const Color neutral06 = Color(0xFF998F8A);
const Color neutral07 = Color(0xFFB4A9A4);
const Color neutral08 = Color(0xFFD0C4BF);
const Color neutral09 = Color(0xFFECE0DB);
const Color neutral10 = Color(0xFFFFFFFF);
ThemeModel get theme => ThemeModel(
      primary01: primary01,
      primary02: primary02,
      primary03: primary03,
      primary04: primary04,
      primary05: primary05,
      primary06: primary06,
      primary07: primary07,
      primary08: primary08,
      primary09: primary09,
      secondary01: secondary01,
      secondary02: secondary02,
      secondary03: secondary03,
      secondary04: secondary04,
      secondary05: secondary05,
      secondary06: secondary06,
      secondary07: secondary07,
      secondary08: secondary08,
      secondary09: secondary09,
      tertiary01: tertiary01,
      tertiary02: tertiary02,
      tertiary03: tertiary03,
      tertiary04: tertiary04,
      tertiary05: tertiary05,
      tertiary06: tertiary06,
      tertiary07: tertiary07,
      tertiary08: tertiary08,
      tertiary09: tertiary09,
      error01: error01,
      error02: error02,
      error03: error03,
      error04: error04,
      error05: error05,
      error06: error06,
      error07: error07,
      error08: error08,
      error09: error09,
      neutral00: neutral00,
      neutral01: neutral01,
      neutral02: neutral02,
      neutral03: neutral03,
      neutral04: neutral04,
      neutral05: neutral05,
      neutral06: neutral06,
      neutral07: neutral07,
      neutral08: neutral08,
      neutral09: neutral09,
      neutral10: neutral10,
    );
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF244EE1),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFDDE1FF),
  onPrimaryContainer: Color(0xFF001355),
  secondary: Color(0xFF5A5D72),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFDFE1F9),
  onSecondaryContainer: Color(0xFF171B2C),
  tertiary: Color(0xFF76546E),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD7F3),
  onTertiaryContainer: Color(0xFF2C1229),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFE2E1EC),
  onSurfaceVariant: Color(0xFF45464F),
  outline: Color(0xFF767680),
  onInverseSurface: Color(0xFFF3F0F4),
  inverseSurface: Color(0xFF303034),
  inversePrimary: Color(0xFFB8C3FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF244EE1),
  outlineVariant: Color(0xFFC6C6D0),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFB8C3FF),
  onPrimary: Color(0xFF002387),
  primaryContainer: Color(0xFF0035BD),
  onPrimaryContainer: Color(0xFFDDE1FF),
  secondary: Color(0xFFC3C5DD),
  onSecondary: Color(0xFF2C2F42),
  secondaryContainer: Color(0xFF424659),
  onSecondaryContainer: Color(0xFFDFE1F9),
  tertiary: Color(0xFFE4BAD9),
  onTertiary: Color(0xFF44273E),
  tertiaryContainer: Color(0xFF5C3D56),
  onTertiaryContainer: Color(0xFFFFD7F3),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE4E1E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFC8C5CA),
  surfaceVariant: Color(0xFF45464F),
  onSurfaceVariant: Color(0xFFC6C6D0),
  outline: Color(0xFF8F909A),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE4E1E6),
  inversePrimary: Color(0xFF244EE1),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFB8C3FF),
  outlineVariant: Color(0xFF45464F),
  scrim: Color(0xFF000000),
);

class StyleConfigs {
  static final dark = ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    dividerColor: const Color(0xff1d1f29),
    textTheme: TextTheme(
      bodyMedium: TextDefine.t2_R.copyWith(color: const Color(0xffffffff)),
    ),
  );

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: neutral10,
    appBarTheme: AppBarTheme(
        color: neutral10,
        elevation: 2,
        titleTextStyle: TextDefine.h1_B
            .copyWith(color: primary03, fontFamily: 'Quicksand')),
    textTheme: TextTheme(
      bodyLarge: TextDefine.t2_R.copyWith(color: theme.neutral00),
      bodyMedium: TextDefine.te1_R.copyWith(color: theme.neutral00),
      titleMedium: TextDefine.t1_R.copyWith(color: theme.neutral00),
    ).apply(fontFamily: 'Quicksand'),
    // inputDecorationTheme: InputDecorationTheme(
    //     labelStyle: TextDefine.t2_R.copyWith(color: neutral00),
    //     hintStyle: const TextStyle(
    //         color: neutral07, fontSize: 16, fontWeight: FontWeight.w500),
    //     focusColor: Colors.transparent,
    //     hoverColor: Colors.transparent,
    //     fillColor: Colors.white,
    //     contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    //     filled: true,
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(4),
    //       borderSide: const BorderSide(width: 1, color: neutral00),
    //     ),
    //     activeIndicatorBorder: const BorderSide(color: neutral00),
    //     disabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4),
    //         borderSide: const BorderSide(width: 1, color: neutral00)),
    //     enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4),
    //         borderSide: const BorderSide(width: 1, color: neutral00)),
    //     focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4),
    //         borderSide: const BorderSide(width: 1, color: neutral00)),
    //     errorBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4),
    //         borderSide: const BorderSide(width: 1, color: neutral00)),
    //     focusedErrorBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(4),
    //         borderSide: const BorderSide(width: 1, color: neutral00)),
    //     outlineBorder: const BorderSide(color: primary04)),
    radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) =>
            states.any((element) => MaterialState.selected == element)
                ? primary01
                : neutral05)),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(neutral00),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: const BorderSide(width: 1, color: neutral06),
      checkColor: MaterialStateProperty.all(neutral10),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: neutral00,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Quicksand',
            ),
            backgroundColor: neutral10)),
    dividerTheme: const DividerThemeData(color: neutral05),
  );
}
