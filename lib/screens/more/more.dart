import 'package:animalapp/themes/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'expandble_widget.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Animalia",
            style: GoogleFonts.aclonica(
                textStyle: TextStyle(
                    color: Colors.greenAccent.shade400,
                    fontWeight: FontWeight.bold))),
      ),
      body: ListView(
        children: [
          ExpandableGroup(
            isExpanded: false,
            expandedIcon: Icon(
              Icons.arrow_drop_up,
              color: Colors.white,
            ),
            collapsedIcon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            header: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Reference",
                style: heading,
              ),
            ),
            items: [
              ListTile(
                  title: Text("About Reference", style: title),
                  subtitle: Text(
                    "Animals form the largest of the natural world's five kingdoms, with nearly 2 million different animal species having been recorded and new animals are still constantly being discovered. Animals are the most varied living things on the planet and you would think so after having evolved and adapted to their surroundings for more than a billion years. Different levels of animals from prey to predators, and from those animals that live on the sea bed to those animals that rule the skies, all make up the animal kingdom.Despite the fact that the evolution of animals came after the evolution of other living species, animals are now the dominant form of life on Earth. Two main reasons why animals have taken over, are the fact that animals can move, and that animals are successfully able to adapt to changing environments in order to continue surviving successfully.Throughout this section, we look into what sets animals apart from other living organisms and from one another. We will also look at their behaviour including how they communicate and interact with others; their anatomy including skeletons, senses and movement; the habitats in which they live; and the conservation that is being done around the world to try and protect them.",
                    style: normalText.copyWith(color: Colors.grey[300]),
                  )),
            ],
          ),
          ExpandableGroup(
            isExpanded: true,
            expandedIcon: Icon(
              Icons.arrow_drop_up,
              color: Colors.white,
            ),
            collapsedIcon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            header: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Features",
                style: heading,
              ),
            ),
            items: [
              ListTile(
                title: Text('App includes all over Animals on planet',
                    style: normalText.copyWith(color: Colors.grey[300])),
              ),
              ListTile(
                title: Text('Similar Animals by classname.',
                    style: normalText.copyWith(color: Colors.grey[300])),
              ),
              ListTile(
                title: Text('Autocomplete search fetaure.',
                    style: normalText.copyWith(color: Colors.grey[300])),
              ),
              ListTile(
                title: Text('add Favorite Animals.',
                    style: normalText.copyWith(color: Colors.grey[300])),
              ),
            ],
          ),
          ExpandableGroup(
            isExpanded: true,
            expandedIcon: Icon(
              Icons.arrow_drop_up,
              color: Colors.white,
            ),
            collapsedIcon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            header: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "App Information",
                style: heading,
              ),
            ),
            items: [
              ListTile(
                title: Text('App Created with Flutter bloc library.',
                    style: normalText.copyWith(color: Colors.grey[300])),
              ),
              ListTile(
                onTap: () {
                  launch("https://github.com/Appii00");
                },
                title: Text('Share My application',
                    style: normalText.copyWith(color: Colors.white)),
              ),
              ListTile(
                onTap: () {
                  Share.share(
                      'If people are educated about the world’s animal species they will better care for them. Check Out Animalia app to aware about animals\n\n https://github.com/Appii00 ',
                      subject: 'Look what I made!');
                },
                title: Text('Socure code of application',
                    style: normalText.copyWith(
                        color: Colors.greenAccent.shade400)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
