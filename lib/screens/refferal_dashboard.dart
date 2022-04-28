import 'package:flutter/material.dart';

class ReferralDashboard extends StatefulWidget {
  const ReferralDashboard({Key? key}) : super(key: key);

  @override
  _ReferralDashboardState createState() => _ReferralDashboardState();
}

class _ReferralDashboardState extends State<ReferralDashboard> {
  int reward = 0;
  int referral = 3;

  int cashEarned() {
    setState(() {
      if (referral > 0) {
        reward = 1000 * referral;
      }
    });
    return reward;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   cashEarned();
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Referral Dashboard"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Your Rewards",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Total Cash Earned !",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: 100,
                      child: Text(
                       "${cashEarned()}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      //    color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 60,
                      child: Image.asset("assets/1.png"),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "View Payment History >",
                style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Referrals",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 20,
                    child: Text(
                      "Remind All Pending",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange.shade300),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Reward Status",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Investment Status",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            referalUsers("harry", 1000, "myntra"),
            referalUsers("potter", 2000, "zepp"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),
            referalUsers("snape", 3000, "ecko"),

            SizedBox(
              height: 20,
            ),
            bottomPart(),
          ],
        ),
      ),
    );
  }

  bottomPart() {
    return Container(
     alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "FAQ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "What are the incentives for the referring a friend?",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Is there any eligibility criteria for me to send to out invites?",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "When will I get my referral bonus?",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "When will I receive this bonus?",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }

  referalUsers(String name, int num, String status) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "$num",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "$status",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.black,
        )
      ],
    );
  }
}
