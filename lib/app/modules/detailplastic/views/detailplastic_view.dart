import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:recycleai/theme/color.dart';
import 'package:recycleai/app/component/arrowBack.dart';
import '../controllers/detailplastic_controller.dart';

class DetailplasticView extends GetView<DetailplasticController> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final bodyHeight = mediaQueryHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color.fromARGB(231, 0, 0, 0),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                backgroundColor: bgColor,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                expandedHeight: bodyHeight * 0.4,
                flexibleSpace: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset('assets/images/detail.png', fit: BoxFit.cover),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color.fromARGB(248, 0, 0, 0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: Duration(milliseconds: 500),
                          builder: (context, value, child) {
                            return Opacity(
                              opacity: value,
                              child: child,
                            );
                          },
                          child: Text(
                            'Plastic',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: bodyHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: bgColor,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Plastik adalah material jenis polimer yang tersusun atas rantai monomer serta bersifat ringan. Plastik tergolong kedalam bahan yang sangat sulit untuk diuraikan. Mendaur ulang plastik merupakan solusi untuk mengurangi sampah plastik. Adapun sampah plastik bisa diolah beraneka ragam, mulai pembuatan tas, dompet, mainan anak-anak, bunga hias, pot, dan lain sebagainya. Sederhana ialah kata yang tepat dari pemanfaatan daur ulang sampah plastik. Namun, sampah plastik dapat membuat membuka peluang seseorang dalam berbisnis.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Contoh Pemanfaatan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Pot tanaman, tempat pensil atau pulpen, lampu hias, keranjang",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
