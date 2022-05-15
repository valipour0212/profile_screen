import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', '1'),
        Locale('fa', '98'),
      ],
      locale: const Locale('fa'),
      home: MyHomePage(toggleThemeMode: () {
        setState(() {
          if (themeMode == ThemeMode.dark) {
            themeMode = ThemeMode.light;
          } else {
            themeMode = ThemeMode.dark;
          }
        });
      }),
    );
  }
}

class MyAppThemeConfig {
  final Color primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = const Color(0x0dffffff),
        backgroundColor = const Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondaryTextColor = Colors.grey.shade900.withOpacity(0.8),
        surfaceColor = const Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = const Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme() {
    return ThemeData(
      //Text
      textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
          //Headline
          headline6:
              TextStyle(fontWeight: FontWeight.bold, color: primaryTextColor),
          headline1: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: primaryTextColor),
          //body
          bodyText1: TextStyle(fontSize: 13, color: secondaryTextColor),
          bodyText2: TextStyle(
            fontSize: 15,
            color: primaryTextColor,
          ),
          //SubTitle
          subtitle1: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      //Color
      brightness: brightness,
      appBarTheme: AppBarTheme(
          backgroundColor: appBarColor, foregroundColor: primaryTextColor),
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      dividerColor: surfaceColor,
      //Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: surfaceColor,
      ),
      //Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  const MyHomePage({Key? key, required this.toggleThemeMode}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoshop;

  void updateSelectedSkill(_SkillType skillType) {
    setState(() {
      _skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          const Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: InkWell(
              onTap: widget.toggleThemeMode,
              child: const Icon(CupertinoIcons.ellipsis_vertical),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Brice Seraphin',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 2),
                        const Text('Prodouct & Print Designer'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.location,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Paris, France',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
              child: Row(
                children: [
                  Text(
                    'Skills',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(width: 2),
                  const Icon(CupertinoIcons.chevron_down, size: 12),
                ],
              ),
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Skill(
                    title: 'Photoshop',
                    imagePath: 'assets/images/app_icon_01.png',
                    shadowColor: Colors.blue,
                    skillType: _SkillType.photoshop,
                    isActive: _skill == _SkillType.photoshop,
                    onTap: () {
                      updateSelectedSkill(_SkillType.photoshop);
                    },
                  ),
                  Skill(
                    title: 'Adobe XD',
                    imagePath: 'assets/images/app_icon_05.png',
                    shadowColor: Colors.pink,
                    skillType: _SkillType.xd,
                    isActive: _skill == _SkillType.xd,
                    onTap: () {
                      updateSelectedSkill(_SkillType.xd);
                    },
                  ),
                  Skill(
                    title: 'Illustrator',
                    imagePath: 'assets/images/app_icon_04.png',
                    shadowColor: Colors.orange,
                    skillType: _SkillType.illustrator,
                    isActive: _skill == _SkillType.illustrator,
                    onTap: () {
                      updateSelectedSkill(_SkillType.illustrator);
                    },
                  ),
                  Skill(
                    title: 'After Effect',
                    imagePath: 'assets/images/app_icon_03.png',
                    shadowColor: Colors.blue.shade800,
                    skillType: _SkillType.afterEffect,
                    isActive: _skill == _SkillType.afterEffect,
                    onTap: () {
                      updateSelectedSkill(_SkillType.afterEffect);
                    },
                  ),
                  Skill(
                    title: 'Lightroom',
                    imagePath: 'assets/images/app_icon_02.png',
                    shadowColor: Colors.blue,
                    skillType: _SkillType.lightroom,
                    isActive: _skill == _SkillType.lightroom,
                    onTap: () {
                      updateSelectedSkill(_SkillType.lightroom);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(CupertinoIcons.at),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(CupertinoIcons.lock),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Save'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final _SkillType skillType;
  final Function() onTap;

  const Skill({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.shadowColor,
    required this.isActive,
    required this.skillType,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.5),
                          blurRadius: 20,
                        ),
                      ],
                    )
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}

enum _SkillType {
  photoshop,
  xd,
  illustrator,
  afterEffect,
  lightroom,
}
