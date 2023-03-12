import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondTeamScreen extends StatefulWidget {
  const SecondTeamScreen({Key? key}) : super(key: key);

  @override
  State<SecondTeamScreen> createState() => _SecondTeamScreenState();
}

class _SecondTeamScreenState extends State<SecondTeamScreen>
    with SingleTickerProviderStateMixin {
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
        title: Text("Team 2"),


      ),
      body: SingleChildScrollView(
        child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 40),
            Text("Username",style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),
            Divider(thickness: 1,height: 20,),
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.shade600,
              isScrollable: false,
              tabs: [
                Tab(text: "First",),
                Tab(text: "Second",),

              ],
              onTap: (int value) {
                setState(() => _tabController.index=value);
              },
            ),
            IndexedStack(
              index: _tabController.index,
              children: [
                Visibility(
                  visible: _tabController.index == 0,
                  child: ListView.builder(
                    itemCount: 15,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.note),
                        title: Text("Note #$index"),
                        subtitle: Text("Note info"),
                      );
                    },),
                ),
                Visibility(
                  visible: _tabController.index == 1,
                  child: GridView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10
                    ), itemBuilder: (context, index) {
                    return Container(
                      color: index %2 ==0 ? Colors.pink.shade100 :Colors.blue.shade100,
                    );
                  },),
                ),


              ],
            ),

          ],
        ),
      ),

    );

  }
}
