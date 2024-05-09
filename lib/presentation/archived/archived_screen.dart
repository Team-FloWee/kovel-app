import 'package:flutter/material.dart';
import 'package:kovel_app/presentation/archived/components/archived_item.dart';

class ArchivedScreen extends StatefulWidget {
  const ArchivedScreen({super.key});

  @override
  State<ArchivedScreen> createState() => _ArchivedScreenState();
}

class _ArchivedScreenState extends State<ArchivedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('나의 보관함'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on_rounded),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 16, right: 16),
        child: Align(
          alignment: Alignment.center,
          child: GridView.builder(
            itemCount: 20, // 아이템 개수
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ArchivedItem(
                imagePath: '',
                title: '타이틀',
                badgeTitle: '음식점',
              );
            },
          ),
        ),
      ),
    );
  }
}
