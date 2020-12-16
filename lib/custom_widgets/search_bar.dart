import 'package:flutter/material.dart';
// void main() {
//   runApp( MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme:  ThemeData(
//       primaryColor: const Color(0xFF02BB9F),
//       primaryColorDark: const Color(0xFF167F67),
//       accentColor: const Color(0xFF167F67),
//     ),
//     home:  CountrySearchBar(),
//   ));
// }
class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}
class CountrySearchBar extends StatefulWidget {
  State createState() =>  CountrySearchBarState();
}
class CountrySearchBarState extends State<CountrySearchBar> {
  Item selectedUser;
  List<Item> users = <Item>[
    const Item('Android',Icon(Icons.android,color:  const Color(0xFF167F67),)),
    const Item('Flutter',Icon(Icons.flag,color:  const Color(0xFF167F67),)),
    const Item('ReactNative',Icon(Icons.format_indent_decrease,color:  const Color(0xFF167F67),)),
    const Item('iOS',Icon(Icons.mobile_screen_share,color:  const Color(0xFF167F67),)),
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Item>(
      hint:  Text("Select item"),
      value: selectedUser,
      onChanged: (Item value) {
        setState(() {
          selectedUser = value;
        });
      },
      items: users.map((Item user) {
        return  DropdownMenuItem<Item>(
          value: user,
          child: Row(
            children: <Widget>[
              user.icon,
              SizedBox(width: 10,),
              Text(
                user.name,
                style:  TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}