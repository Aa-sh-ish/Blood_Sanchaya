import 'package:blood_sanchaya/google_map.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size, height, width;
  var _dropDownValue;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          colors: [
            Color(0xffEA5959),
            Color(0xffF5F5F5),
          ],
          begin: FractionalOffset.topRight,
          end: FractionalOffset.bottomLeft,
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Color(0xffEA5959),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Color(0xffEA5959)),
                    accountName: Text(
                      "User name",
                      style: TextStyle(color: Colors.black45),
                    ),
                    accountEmail: Text("User email",
                        style: TextStyle(color: Colors.black45)),
                    currentAccountPicture: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/Logo.png"))),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.update),
                    title: Text("Update Donate Date"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.manage_accounts_sharp),
                    title: Text("Manage Event"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.feedback_rounded),
                    title: Text("FeedBack"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.shield),
                    title: Text("Terms & Condition"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.handshake_outlined),
                    title: Text("Support Us"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.details_outlined),
                    title: Text("About Blood Sanchaya"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.details),
                    title: Text("About Developers"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.login,
                      color: Colors.black45,
                    ),
                    title: Text(
                      "Login As Blood Bank",
                      style: TextStyle(color: Color(0xffEA5959)),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Text("Search Blood",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  child: Column(
                    children: [
                      DropdownButton(
                        hint: _dropDownValue == null
                            ? Text('Dropdown')
                            : Text(
                                _dropDownValue,
                                style: TextStyle(color: Colors.blue),
                              ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: TextStyle(color: Colors.blue),
                        items: ['One', 'Two', 'Three'].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              _dropDownValue = val;
                            },
                          );
                        },
                      ),
                      ElevatedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Google_map()),
                        );
                      },
                          child:Image.asset("assets/map.png")
                      )

                    ],
                  ),
                )
              ],
            )));
  }
}
