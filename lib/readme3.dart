class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  InterstitialAd _interstitialAd;

  @override
  void initState() {
    super.initState();
    _interstitialAd = InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (Ad ad) {
          // Ad is now ready to show at any time.
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print(error);
          ad.dispose();
        },
        onAdClosed: (Ad ad) {
          ad.dispose();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyAppWidget();
  }
}
