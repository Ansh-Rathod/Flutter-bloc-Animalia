import '../../models/pet_info.dart';
import '../types_info/types_info.dart';
import '../../themes/theme.dart';
import '../../widgets/horizontal_list.dart';
import '../../widgets/loading_page.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class PetsInfoPage extends StatelessWidget {
  const PetsInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: CustomScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: [
            SliverAppBarWithShadow(
              title: "pets",
              image:
                  "https://images.unsplash.com/photo-1581647521381-0c75dd5df603?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
              index: 1,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(petsinfo.description, style: normalText),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: Text(
                  "Characteristics of Pets",
                  style: heading.copyWith(color: Colors.greenAccent.shade400),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...petsinfo.characteristics
                        .map((chara) => ExpansionPanelListWidget(
                              info: chara,
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
            for (int i = 0; i < petsinfo.aspet.length; i++)
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                  child: HorizontalList(
                    type: breedInfo[i],
                    pet: petsinfo.aspet[i],
                    index: i,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
