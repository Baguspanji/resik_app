import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resik_app/src/config/constans_assets.dart';
import 'package:resik_app/src/config/constans_config.dart';
import 'package:resik_app/src/config/size_config.dart';
import 'package:resik_app/src/model/widget_model.dart';
import 'package:resik_app/src/ui/nasabah/histori/index.dart';
import 'package:resik_app/src/ui/nasabah/home/index.dart';
import 'package:resik_app/src/ui/nasabah/profile/index.dart';
import 'package:resik_app/src/ui/nasabah/sampah/index.dart';

class NavUI extends StatefulWidget {
  static const String routeName = "/nav";

  @override
  State<NavUI> createState() => _NavUIState();
}

class _NavUIState extends State<NavUI> with SingleTickerProviderStateMixin {
  int indexNav = 0;
  late TabController _tabController;

  List<NavModel> listNav = [
    NavModel(iconHomeOutline, iconHome, "Beranda"),
    NavModel(iconCategory, iconCategory, "Sampah"),
    NavModel(iconArchive, iconArchive, "Histori"),
    NavModel(iconProfileOutline, iconProfile, "Profile"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        indexNav = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeUI(),
          SampahUI(),
          HistoriUI(),
          ProfileUI(),
        ],
      ),
      floatingActionButton: _tabController.index == 1 || indexNav == 1
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: secondaryColor,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 6,
                    child: Container(
                      width: 16,
                      height: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: Text(
                        '2',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : SizedBox(),
      bottomNavigationBar: Container(
        height: 70,
        width: width(context),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < listNav.length; i++)
              _navItem(
                context,
                listNav[i],
                isActive: indexNav == i,
              ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, NavModel svg, {bool isActive = false}) {
    return GestureDetector(
      onTap: () => setState(() {
        indexNav = listNav.indexOf(svg);
        _tabController.animateTo(indexNav);
      }),
      child: Container(
        width: width(context) / 4,
        height: width(context) / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isActive,
              replacement:
                  SvgPicture.asset(svg.svgVisible, color: Colors.black45),
              child: SvgPicture.asset(svg.svgInvisible, color: secondaryColor),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text(
                svg.title,
                style: TextStyle(
                  fontSize: 10,
                  color: isActive ? secondaryColor : Colors.black45,
                  fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
