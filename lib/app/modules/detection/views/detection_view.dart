import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recycleai/app/component/cardDeteksi.dart';
import 'package:recycleai/app/component/cardHistory.dart';
import 'package:recycleai/model/history.dart';
import '../../../routes/app_pages.dart';
import 'package:recycleai/theme/color.dart';
import '../controllers/Detection_controller.dart';

class DetectionView extends GetView<DetectionController> {
  const DetectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detection'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              // margin:
              //     EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: bgColor),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Text(
                        'Menu Deteksi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Card_Deteksi(),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text('History',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final HistoryDetail history = historyList[index];
                        return InkWell(
                          onTap: () => Get.toNamed(Routes.HISTORY),
                          child: Card_History(history: history),
                        );
                      },
                      itemCount: historyList.length,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Card_History extends StatelessWidget {
  const Card_History({
    super.key,
    required this.history,
  });

  final HistoryDetail history;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset('assets/images/history.png', fit: BoxFit.fill),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    history.date,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(history.result),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
