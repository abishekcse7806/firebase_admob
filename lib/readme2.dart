import 'package:flutter/cupertino.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

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
      size: AdSize.banner,
      adUnitId: BannerAd.testAdUnitId,
      listener: AdListener(),
      request: AdRequest(),
    );
    _bannerAd.load();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyAppWidget(),
        Container(
          padding: EdgeInsets.only(bottom: 10.0),
          alignment: Alignment.bottomCenter,
          child: AdWidget(ad: _bannerAd),
        ),
      ],
    );
  }
}
