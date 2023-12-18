import 'package:flutter/Material.dart';

import 'draweritems.dart';

class DrawerItem {

  final String title;
  final IconData icon;

  const DrawerItem({
    required this.title,
    required this.icon
  });
}
class MyDrawer extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItems;

  const MyDrawer(
      {super.key, required this.onSelectedItems});

  @override
  Widget build(BuildContext context) => Container(

    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 102, 16, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),

            Padding(
              padding: EdgeInsets.only(left: 2.0), // Adjust the left padding as needed
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align to the top
                children: [
                  Image.asset("assets/images/profile.png", height: 90,),
                  SizedBox(width: 10.0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Asfand',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set the text color to white
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Developer',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                        ],
                    ),
                  ),
                ],
              ),
            ),



            buildDrawerItems(context),
          ],
        ),
      ),
    ),
  );

  Widget buildDrawerItems(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
    child: Column(
      children: DrawerItems.all.
      map((item) => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        leading: Icon(item.icon, color: Colors.white),
        title: (Text(
          item.title,
          style: const TextStyle(color: Colors.white60,fontSize: 18, fontWeight: FontWeight.bold,),
        )),
        onTap: () => onSelectedItems(item),
      ),
      ).toList(),
    ),
  );
}