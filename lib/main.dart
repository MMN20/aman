import 'package:aman/const.dart';
import 'package:aman/provider/app.dart';
import 'package:aman/screen/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  // 07736657369
  // IGCPPPH5UF
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AppProvider(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: kPrimarycolor, centerTitle: true),
            fontFamily: 'Almarai',
            primaryColor: kPrimarycolor,
            textTheme: GoogleFonts.cairoTextTheme(),
            dropdownMenuTheme: const DropdownMenuThemeData(
              textStyle: TextStyle(
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
                fontSize: 15,
              ),
            )),
        // for making the whole app Right-To-Left
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        home: const SplashScreen(),
      ),
    ),
  );
}
