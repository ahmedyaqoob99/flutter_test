import 'package:ahmed_test_flutter/util/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  final _pages = [
    homePage(),
    Center(child: Text("Page 2")),
    Center(child: Text("Page 3")),
    Center(child: Text("Page 4")),
    Center(child: Text("Page 5")),
  ];

  onSelectedIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Appointment Schedule",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.blackColor,
              fontSize: 17),
        ),
      ),
      body: _pages.elementAt(currentPageIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              Colors.lightBlue,
              Colors.indigo,
            ],
          ),
          color: Colors.deepPurple.shade300,
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          backgroundColor: Colors.transparent,
          onDestinationSelected: onSelectedIndex,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              label: '1',
            ),
            NavigationDestination(
              icon: Icon(Icons.people_alt_outlined),
              label: '2',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today),
              label: '3',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: '4',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu),
              label: '5',
            ),
          ],
        ),
      ),
    );
  }
}

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jan 05, 2021",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.greyColor,
                fontSize: 15),
          ),
          SizedBox(height: media.height * 0.005),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: media.height * 0.18,
                  child: Card(
                    elevation: 0.2,
                    shadowColor: AppColors.greyColor,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 40,
                            child: Image.asset("assets/images/image.png"),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Accepted",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 14),
                                  ),
                                  SizedBox(width: 10),
                                  SvgPicture.asset(
                                    height: 15,
                                    "assets/icons/Component 6 – 2.svg",
                                    fit: BoxFit.scaleDown,
                                  )
                                ],
                              ),
                              SizedBox(height: media.height * 0.005),
                              Text(
                                "Devin Shelton",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor,
                                    fontSize: 17),
                              ),
                              SizedBox(height: media.height * 0.005),
                              Text(
                                "Received at 12:00 AM",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 20,
                          height: media.height * 0.18,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Icon(Icons.keyboard_arrow_right,
                              color: AppColors.whiteColor),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
