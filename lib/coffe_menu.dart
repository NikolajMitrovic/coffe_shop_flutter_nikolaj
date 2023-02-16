import 'package:coffe_shop_flutter/_all.dart';
import 'package:coffe_shop_flutter/likes_bloc/likes_bloc.dart';
import 'package:coffe_shop_flutter/likes_bloc/likes_event.dart';
import 'package:coffe_shop_flutter/likes_bloc/likes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeMenu extends StatefulWidget {
  const CoffeeMenu({super.key});

  @override
  State<CoffeeMenu> createState() => _CoffeeMenuState();
}

class _CoffeeMenuState extends State<CoffeeMenu> {
  List coffeList = [
    BrewingCoffee(
      title: 'Brewing Coffee',
      name: 'Chemex',
      price: 15,
      description: 'Try coffes from Keniya, Ethiopia',
      picture: 'assets/chemex.jpg',
      details: 'Coffee is brewed by placing coarsely ground coffee in the empty beaker and adding hot—between 93–96 °C. Plunging slowly is purported to maximize the extraction of the oils and flavonoids from the ground bean',
    ),
    BrewingCoffee(
      title: 'Brewing Coffee',
      name: 'French Press',
      price: 20,
      description: 'Try coffes from Sumatra, Mexico',
      picture: 'assets/french_press.jpg',
      details: 'A full-bodied cup using a metal filter permits oils to pass. Draker roasts typically taste better brewed this way. Try coffees from Sumatra, Mexico or Brazil',
    ),
    BrewingCoffee(
      title: 'Brewing Coffee',
      name: 'Chemex',
      price: 15,
      description: 'Try coffes from Keniya, Ethiopia',
      picture: 'assets/chemex.jpg',
      details: 'Coffee is brewed by placing coarsely ground coffee in the empty beaker and adding hot—between 93–96 °C. Plunging slowly is purported to maximize the extraction of the oils and flavonoids from the ground bean',
    ),
    BrewingCoffee(
      title: 'Brewing Coffee',
      name: 'French Press',
      price: 20,
      description: 'Try coffes from Sumatra, Mexico',
      picture: 'assets/french_press.jpg',
      details: 'A full-bodied cup using a metal filter permits oils to pass. Draker roasts typically taste better brewed this way. Try coffees from Sumatra, Mexico or Brazil',
    ),
  ];

  List espresso = [
    BrewingCoffee(
      title: 'Esspresso Coffee',
      name: 'Latte',
      price: 10,
      description: 'Steamed milk and thin layer of foam',
      picture: 'assets/latte.jpg',
      details: 'In Italy, caffè latte is almost always prepared at home, for breakfast only. This coffee beverage is brewed with a stovetop moka pot and poured into a cup containing heated milk.',
    ),
    BrewingCoffee(
      title: 'Esspresso Coffee',
      name: 'Cappuccino',
      price: 8,
      description: 'Steamed milk and lots of foam',
      picture: 'assets/cappuccino.jpg',
    ),
    BrewingCoffee(
      title: 'Esspresso Coffee',
      name: 'Latte',
      price: 10,
      description: 'Steamed milk and thin layer of foam',
      picture: 'assets/latte.jpg',
      details: 'In Italy, caffè latte is almost always prepared at home, for breakfast only. This coffee beverage is brewed with a stovetop moka pot and poured into a cup containing heated milk.',
    ),
    BrewingCoffee(
      title: 'Esspresso Coffee',
      name: 'Cappuccino',
      price: 8,
      description: 'Steamed milk and lots of foam',
      picture: 'assets/cappuccino.jpg',
      details: 'Outside of Italy, cappuccino is a coffee drink that today is typically composed of a single espresso shot and hot milk, with the surface topped with foamed milk. Cappuccinos are most often prepared with an espresso machine.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.brown, BlendMode.overlay),
                image: AssetImage('assets/coffe_shop.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.brown.withOpacity(0.8),
                  Colors.brown.withOpacity(0.8),
                  Colors.brown.withOpacity(0.8),
                  Colors.brown.withOpacity(0.7),
                  Colors.brown.withOpacity(0.7),
                  Colors.brown.withOpacity(0.6),
                  Colors.brown.withOpacity(0.6),
                  Colors.brown.withOpacity(0.5),
                  Colors.brown.withOpacity(0.5),
                  Colors.brown,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Brewing Coffee',
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(10.0, 10.0),
                        blurRadius: 3.0,
                        color: Colors.transparent,
                      ),
                    ],
                    color: Color.fromARGB(255, 253, 188, 165),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeList.length,
                    itemBuilder: (context, index) {
                      return BlocProvider(
                        create: (context) => LikesBloc(),
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CoffeeDetails(
                                model: coffeList[index],
                              ),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32),
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(100),
                              child: Card(
                                color: const Color.fromRGBO(212, 166, 149, 1),
                                child: SizedBox(
                                  width: 150,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(
                                                20,
                                              ),
                                              topLeft: Radius.circular(
                                                20,
                                              ),
                                            ),
                                            child: SizedBox.fromSize(
                                              size: const Size.fromRadius(100),
                                              child: Image.asset(
                                                coffeList[index].picture,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          BlocBuilder<LikesBloc, LikesState>(
                                            builder: (context, likesState) {
                                              return Padding(
                                                padding: const EdgeInsets.only(left: 140.0),
                                                child: IconButton(
                                                  onPressed: () => context.read<LikesBloc>().add(LikesChangedEvent()),
                                                  icon: Icon(
                                                    likesState.isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                                                    size: 24,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              coffeList[index].name,
                                              style: TextStyle(color: Colors.brown[600], fontSize: 20),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '\$${coffeList[index].price}',
                                              style: const TextStyle(color: Colors.white, fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          coffeList[index].description,
                                          style: TextStyle(color: Colors.brown[600], fontSize: 16),
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //Ovde počinje drugi ListView

                const Text(
                  'Esspresso',
                  style: TextStyle(
                    color: Color.fromARGB(255, 253, 188, 165),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: espresso.length,
                    itemBuilder: (context, index) {
                      return BlocProvider(
                        create: (context) => LikesBloc(),
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CoffeeDetails(
                                model: espresso[index],
                              ),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(36),
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(100),
                              child: Card(
                                color: const Color.fromRGBO(212, 166, 149, 1),
                                child: SizedBox(
                                  width: 150,
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(
                                                20,
                                              ),
                                              topLeft: Radius.circular(
                                                20,
                                              ),
                                            ),
                                            child: SizedBox.fromSize(
                                              size: const Size.fromRadius(100),
                                              child: Image.asset(
                                                espresso[index].picture,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          BlocBuilder<LikesBloc, LikesState>(
                                            builder: (context, likesState) {
                                              return Padding(
                                                padding: const EdgeInsets.only(left: 140.0),
                                                child: IconButton(
                                                  onPressed: () => context.read<LikesBloc>().add(LikesChangedEvent()),
                                                  icon: Icon(
                                                    likesState.isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                                                    size: 24,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              espresso[index].name,
                                              style: TextStyle(color: Colors.brown[600], fontSize: 20),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '\$${espresso[index].price}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          espresso[index].description,
                                          style: TextStyle(color: Colors.brown[600], fontSize: 16),
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
