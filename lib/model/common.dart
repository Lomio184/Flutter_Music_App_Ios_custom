import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const EdgeInsets defaultInsets = EdgeInsets.symmetric(
  horizontal:15,
  vertical: 5
);

const EdgeInsets upInsets = EdgeInsets.symmetric(
  vertical : 15
);

const EdgeInsets sideInsets = EdgeInsets.symmetric(
  horizontal: 15
);

const EdgeInsets itemUpInsets = EdgeInsets.symmetric(
  vertical : 5
);

TextStyle defaultTextStyle = GoogleFonts.vidaloka(
  textStyle : TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w200,
    color : Colors.grey[100]
  )
);

TextStyle headTextStyle = GoogleFonts.vidaloka(
  textStyle : TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color : Colors.white
  )
);

TextStyle bottomTextStyle = GoogleFonts.vidaloka(
  textStyle : TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w300,
  )
);

Widget itemHead({String? title}) {
    return Padding(
      padding: upInsets,
      child: Text(
        title!,
        style: headTextStyle
      ),
    );
  }

