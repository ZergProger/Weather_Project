import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_project/pages/home_page_weather/widget_home_page/list_tile_widget.dart';
import 'package:weather_project/bloc/weather_bloc.dart';
import 'package:weather_project/res/texts.dart';
import 'package:weather_project/pages/setting_page/settings.dart';
import 'package:weather_project/weather_repository/abstract_weather_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weatherListBloc = WeatherListBloc(GetIt.I<AbstractWeatherRepository>());

  @override
  void initState() {
    super.initState();
    weatherListBloc.add(WeatherListLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.textWeather),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Settings())),
              icon: Icon(Icons.settings),
              color: Colors.white,
              iconSize: 25,
            )
          ],
        ),
        body: BlocBuilder<WeatherListBloc, WeatherListState>(
          bloc: weatherListBloc,
          builder: (context, state) {
            if (state is WeatherListLoaded) {
              return ListView.separated(
                itemCount: state.weatherList.length,
                itemBuilder: (BuildContext context, index) {
                  final data = state.weatherList[index];
                  return ListTileWidget(
                    data: data,
                    key: ValueKey(data.dataUnixKey),
                  );
                },
                separatorBuilder: (context, index) => const Divider(color: Colors.black45),
              );
            }
            if (state is WeatherLoadFailed) {
              return Center(
                child: Text(state.exception?.toString() ?? 'Expect'),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
