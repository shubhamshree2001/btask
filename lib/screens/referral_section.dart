import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';


class ReferralSection extends StatefulWidget {
  final String user;
  const ReferralSection({Key? key,required this.user}) : super(key: key);

  @override
  _ReferralSectionState createState() => _ReferralSectionState();
}

class _ReferralSectionState extends State<ReferralSection> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;


  String? _linkMessage;
  bool _isCreatingLink = false;
  var linkDynamic = "";
  var link = "https://bhive.page.link/Qudh";

  @override
  void initState() {
    super.initState();

    initDynamicLinks();
  }

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      Navigator.pushNamed(context, dynamicLinkData.link.path);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  // Future<void> _createDynamicLink(bool short) async {
  //   setState(() {
  //     _isCreatingLink = true;
  //     var linkDynamic = "https://bhivetask.page.link/${user.uid}";
  //   });

  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     uriPrefix: 'https://bhive.page.link',
  //     link: Uri.parse(linkDynamic),
  //     androidParameters: const AndroidParameters(
  //       packageName: 'io.flutter.plugins.firebase.dynamiclinksexample',
  //       minimumVersion: 0,
  //     ),
  //     iosParameters: const IOSParameters(
  //       bundleId: 'io.invertase.testing',
  //       minimumVersion: '0',
  //     ),
  //   );
  //
  //   Uri url;
  //   if (short) {
  //     final ShortDynamicLink shortLink =
  //         await dynamicLinks.buildShortLink(parameters);
  //     url = shortLink.shortUrl;
  //   } else {
  //     url = await dynamicLinks.buildLink(parameters);
  //   }
  //
  //   setState(() {
  //     _linkMessage = url.toString();
  //     _isCreatingLink = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Referral Section"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Hey ${widget.user},",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Refer to,",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
             // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        shareLink();
                      },
                      icon: Icon(
                        Icons.share,
                        size: 30,
                      )),
                  Container(

                    height: 110,
                    width: 160,
                    child: Image.asset("assets/2.png",fit: BoxFit.fill,),
                  ),
                  SizedBox(width: 1,),
                ],
              ),
              height: 150,
              width: width,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hey, have you tried BHIVE.fund? ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "I've been investing with them and thought you'd love it too ! ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "BHIVE.fund is one of India's Largest and fastest growing investment platforms. ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Investing with them is fast & easy.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Click on the link to start investing",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            TextButton(
              onPressed: () {
                print("Link");
              },
              child: Text(
                "*** link***",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

   shareLink() async {
   await  Share.share('https://bhive.page.link/${widget.user}');
   }
}
