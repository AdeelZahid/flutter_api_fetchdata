import 'package:flutter/material.dart';
import 'package:myapp/providors/user-providor.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List users = [];

  @override
  void initState() {
    super.initState();
    getUsersList();
  }

  getUsersList() async {
    var _users = await getUsers();
    setState(() {
      users = _users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.orange,
            ),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              var user = users[index];
              return ListTile(
                title: Text(user['name']['first'] + ' ' + user['name']['last']),
                subtitle: Text(user['email']),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user['picture']['medium']),
                ),
              );
            },
          )),
    );
  }
}
