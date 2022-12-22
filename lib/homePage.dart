import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var  size,height,width;
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
              Color(0xffF70010),
              Colors.white,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          )
      ),
    child: Scaffold(
    backgroundColor: Colors.transparent,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height*0.01,),
        Text("Search Blood",
    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
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
    )
            ],

          ),
          
        )
      ],

    )
    )
    );
  }
}
