import 'package:flutter/cupertino.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: appId);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
    );

    _bannerAd
      ..load()
      ..show(
        anchorOffset: 10.0,
        anchorType: AnchorType.bottom,
      );
  }

  @override
  Widget build(BuildContext context) {
    return MyAppWidget();
  }
}
