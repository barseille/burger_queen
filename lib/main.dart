import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:
          "Burger Queen", // Utilisé par le système pour identifier l'application.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 72, 127, 223)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(title: 'Burger Queen'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  final TextStyle titleStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Color.fromRGBO(26, 24, 161, 1));

  @override
  Widget build(BuildContext context) {
    Widget sectionTitle({required String title}) {
      return Padding(
        padding: const EdgeInsets.only(left: 8, top: 8),
        child: Text(title, style: titleStyle),
      );
    }

    @override
    Container burgerCard(
        {required String name,
        required String url,
        required String description}) {
      double size = 250;
      TextStyle descriptionStyle =
          const TextStyle(fontStyle: FontStyle.italic, color: Colors.black54);
      return Container(
        margin: const EdgeInsets.all(12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color.fromARGB(255, 70, 58, 233).withOpacity(0.3),
        ),
        height: size,
        width: size,
        child: Column(
          children: [
            Image.asset(
              "assets/images/$url.jpg",
              height: size * 0.6,
              width: size,
              fit: BoxFit.cover,
            ),
            Text(
              name,
              style: titleStyle,
            ),
            Text(
              description,
              style: descriptionStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    @override
    Container sideDish({required String name, required String url}) {
      return Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage("assets/images/$url.jpg"),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 37, 33, 243),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const Divider(
                indent: 8,
                endIndent: 8,
              )
            ],
          ));
    }

    @override
    Container drink({required String name, required String url}) {
      const double height = 250;
      const double width = 125;

      return Container(
        margin: const EdgeInsets.all(8),
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              "assets/images/$url.jpg",
              fit: BoxFit.cover,
              height: height,
            ),
            Text(name,
                style: const TextStyle(
                  color: Color.fromARGB(255, 33, 37, 243),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      );
    }

    @override
    Container douceur(
        {required String name, required String url, required double size}) {
      return Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/$url.jpg",
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(2),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Text(name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.token),
        actions: const [Icon(Icons.person)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section restaurant le plus proche
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 150,
              child: Center(
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const Text(
                              "Mon restaurant le plus proche",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              "4 kms",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 5, 37, 221),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.touch_app, color: Colors.white),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Commander",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Section en ce moment
            sectionTitle(title: "En ce moment"),

            Center(
              child: Card(
                // adoucit les bords et réduit l'effet de pixellisation
                clipBehavior: Clip.antiAlias,
                // une ombre en dessous de la carte
                elevation: 10,
                child: Container(
                  // MediaQuery.of(context) : informations sur la taille de l'écran
                  // .size.height : Cela obtient la hauteur totale de l'écran
                  // height: ... * 0.5 : Cela fixe la hauteur du rectangle à la moitié de la hauteur totale de l'écran
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/layer-burger.jpg"),
                          fit: BoxFit.cover)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Une petite faim ?",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          "Venez personnaliser votre burger",
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                        )
                      ]),
                ),
              ),
            ),
            // Nos choix de burgers
            sectionTitle(title: "Chaud devant !"),
            const Text("le meilleur de nos burgers à portés de clic"),
            SizedBox(
                height: 250,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      burgerCard(
                          name: "Twins",
                          url: "twins",
                          description:
                              "Le burger des jumeaux qui font la paire"),
                      burgerCard(
                          name: "Big Queens",
                          url: "big-queen",
                          description:
                              "Pour celles qui porte la coronneà la maison"),
                      burgerCard(
                          name: "Egg Bacon",
                          url: "egg-bacon-burger",
                          description: "le burger des lève tôt"),
                      burgerCard(
                          name: "Prince",
                          url: "prince",
                          description: "Le préféré des futurs rois"),
                      burgerCard(
                          name: "Cheese",
                          url: "cheese",
                          description: "Le classique des fans de fromage")
                    ],
                  ),
                )),
            sectionTitle(title: "Les Accompagnements"),
            Card(
              elevation: 8,
              child: Column(
                children: [
                  sideDish(name: "Frites maison", url: "fries"),
                  sideDish(name: "Frite de patate douce", url: "patate-douce"),
                  sideDish(name: "Poutine", url: "poutine"),
                  sideDish(name: "Potatoes", url: "potatoes"),
                ],
              ),
            ),
            // Les boissons
            sectionTitle(title: "Une petite soif ?"),
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    drink(name: "Le classique", url: "classic-cola"),
                    drink(name: "Eau gazeuse", url: "sparkling"),
                    drink(name: "A l'orange", url: "orange-soda"),
                    drink(name: "Goût fraise", url: "strawberry-soda"),
                  ],
                ),
              ),
            ),
            //section pour finir une touche sucrée
            sectionTitle(title: "Pour finir une petite touche sucrée"),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                douceur(
                    name: "Glace Oréo",
                    url: "oreo-ice",
                    size: MediaQuery.of(context).size.width * 0.4),
                douceur(
                    name: "Crêpe Fraise",
                    url: "strawberry-waffle",
                    size: MediaQuery.of(context).size.width * 0.4),
                douceur(
                    name: "Donut",
                    url: "donut",
                    size: MediaQuery.of(context).size.width * 0.4),
                douceur(
                    name: "Cupcake",
                    url: "cupcake",
                    size: MediaQuery.of(context).size.width * 0.4),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: sectionTitle(title: "Et bon appétit bien sûr !"),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
