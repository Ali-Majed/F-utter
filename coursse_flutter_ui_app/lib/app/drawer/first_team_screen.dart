import 'package:flutter/material.dart';

class FirstTeamScreen extends StatefulWidget {
  const FirstTeamScreen({Key? key}) : super(key: key);

  @override
  State<FirstTeamScreen> createState() => _FirstTeamScreenState();
}

class _FirstTeamScreenState extends State<FirstTeamScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team 1"),
        bottom:TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade600,
          isScrollable: false,
          tabs: [
            Tab(text: "First",),
            Tab(text: "Second",),
          ],
        ),

      ),
      body: TabBarView(

        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.note),
                title: Text("Note #$index"),
                subtitle: Text("Note info"),
              );
            },),
          GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
            ), itemBuilder: (context, index) {
            return Container(
              color: index %2 ==0 ? Colors.pink.shade100 :Colors.blue.shade100,
            );
          },)

        ],
      ),
    );
  }
}