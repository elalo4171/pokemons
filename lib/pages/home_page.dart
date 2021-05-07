import 'package:equipos_pokemon/bloc/home/home_bloc.dart';
import 'package:equipos_pokemon/config/api_rest.dart';
import 'package:equipos_pokemon/config/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final ApiRest apiRest = new ApiRest();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(apiRest),
      child: _BuildHome(),
    );
  }
}

class _BuildHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _responsive = Responsive(context);
    return Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Stack(
        children: [
          Positioned(
            right: -80,
            top: -70,
            child: Image.asset(
              'assets/pokeball.png',
              height: 280,
              fit: BoxFit.fill,
              color: Colors.grey.withOpacity(.2),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.menu, size: 35), onPressed: () {}),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pokedex",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (!state.havePokemons) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return SizedBox(
                      height: _responsive.height * .85,
                      child: GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(
                            30,
                            (index) => Container(
                                height: 100,
                                color: index % 2 == 0
                                    ? Colors.orange
                                    : Colors.blueAccent,
                                child: Text("Item "))),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      );
    }));
  }
}
