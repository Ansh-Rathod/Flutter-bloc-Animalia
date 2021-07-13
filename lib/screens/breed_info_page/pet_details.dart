import 'package:animalapp/screens/all_breed_animals/all_breeds_animals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/animal_model.dart';
import '../../models/pet_info.dart';
import 'bloc/get_pets_bloc.dart';
import '../../themes/theme.dart';
import '../../widgets/animals_list.dart';
import '../../widgets/error_page.dart';
import '../../widgets/loading_page.dart';

class PetDetails extends StatelessWidget {
  final PetbyBreed type;
  final AsPet pet;
  final int index;
  const PetDetails({
    Key? key,
    required this.type,
    required this.pet,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
          backgroundColor: scaffoldColor,
          body: BlocBuilder<GetPetsBloc, GetPetsState>(
            builder: (context, state) {
              if (state is GetPetsloaded) {
                return GetPetsTypeInfoWidget(
                  type: type,
                  index: index,
                  animals: state.animals,
                  pet: pet,
                );
              } else if (state is GetPetsloading) {
                return LoadingPage(
                  image: type.image,
                  title: type.title,
                  index: index,
                );
              } else if (state is GetPetsError) {
                return ErrorPage();
              }
              return Container();
            },
          )),
    );
  }
}

class GetPetsTypeInfoWidget extends StatelessWidget {
  final PetbyBreed type;
  final AsPet pet;

  final int index;
  final List<Animals> animals;
  const GetPetsTypeInfoWidget({
    Key? key,
    required this.type,
    required this.pet,
    required this.index,
    required this.animals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        SliverAppBarWithShadow(
          title: type.title,
          image: type.image,
          index: index,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(type.description, style: normalText),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pet.cons.key,
                    style: title.copyWith(color: Colors.grey[50]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "- " + pet.cons.data.replaceAll("\n", "\n- "),
                    softWrap: true,
                    style: normalText.copyWith(color: Colors.grey[100]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pet.pros.key,
                    style: title.copyWith(color: Colors.grey[50]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "- " + pet.pros.data.replaceAll("\n", "\n- "),
                    softWrap: true,
                    style: normalText.copyWith(color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  type.title,
                  style: heading.copyWith(color: Colors.greenAccent.shade400),
                ),
                trailing: IconButton(
                  tooltip: "See all",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllAnimalsByBreed(
                          index: index,
                          image: type.image,
                          name: type.title,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_forward,
                      color: Colors.greenAccent.shade400),
                ),
              )),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 9 / 16),
                // scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  for (var i = 0; i < animals.length; i++)
                    AnimalsGridCard(
                      animals: animals[i],
                      index: i,
                    )
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 30),
        )
      ],
    );
  }
}
