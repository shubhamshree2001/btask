import 'package:bhivetask/screens/referral_section.dart';
import 'package:bhivetask/screens/refferal_dashboard.dart';
import 'package:bhivetask/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User user;
  bool isSignedIn = false;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignIn()));
      }
    });
  }

  getUser() {
    User? user = _auth.currentUser; //get user
    user?.reload(); //reload user
    user = _auth.currentUser; //then provide current user
    if (user != null) {
      setState(() {
        this.user = user!;
        this.isSignedIn = true;
      });
    }
    print(this.user);
  }

  void signOutUser() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Referral Section"),
        centerTitle: true,
        actions: [IconButton(onPressed: (){
          print("signout user");
          signOutUser();
        }, icon: Icon(Icons.add_to_home_screen))],
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
              "Hey ${user.displayName},",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Why don't you introduce us to your friends? ",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Invite a friend to invest on BHive.fund and get a cashback equal to 1% of their investment. ",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReferralSection(user: user.displayName.toString(),)));
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: width,
                child: Text(
                  "Refer a Friend! ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ReferralDashboard()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: width,
                child: Text(
                  "Referral Dashboard ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
