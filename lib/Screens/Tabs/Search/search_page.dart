import 'package:flutter/material.dart';

import 'package:seeker_app/Screens/Tabs/Search/widgets/disappearance_item.dart';
import 'package:seeker_app/models/disappearance.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height - MediaQuery.of(context).padding.top,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Seeker',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5DD39E),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 5),
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.search),
                    ),
                    hintText: 'Buscar',
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 165,
                  childAspectRatio: 9 / 10,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                children: [
                  DisappearanceItem(
                    date: DateTime.now(),
                    imageUrl: '',
                    name: 'Carlos Ezeta',
                    status: Status.Missing,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
