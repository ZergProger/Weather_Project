import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/bloc/weather_bloc.dart';
import 'package:weather_project/pages/home_page_weather/widgets/list_tile_widget.dart';

class ListViewCustom extends StatefulWidget {
  ListViewCustom({
    super.key,
    required this.weatherListBloc,
    required this.refreshCompleter,
  });

  Completer<void> refreshCompleter;
  final WeatherListBloc weatherListBloc;

  @override
  State<ListViewCustom> createState() => _ListviewCustomState();
}

class _ListviewCustomState extends State<ListViewCustom> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        widget.refreshCompleter = Completer<void>();
        widget.weatherListBloc.add(WeatherListLoad());
        return widget.refreshCompleter.future;
      },
      child: BlocListener<WeatherListBloc, WeatherListState>(
        bloc: widget.weatherListBloc,
        listener: (context, state) {
          if (state is WeatherListLoaded || state is WeatherLoadFailed) {
            widget.refreshCompleter.complete();
          }
        },
        child: BlocBuilder<WeatherListBloc, WeatherListState>(
          bloc: widget.weatherListBloc,
          builder: (context, state) {
            if (state is WeatherListLoaded) {
              return ListView.builder(
                itemCount: state.weatherList.length,
                itemBuilder: (BuildContext context, index) {
                  final data = state.weatherList[index];
                  return ListTileWidget(
                    data: data,
                    key: ValueKey(data.dataUnixKey),
                  );
                },
              );
            }
            if (state is WeatherLoadFailed) {
              return Center(child: Text('Error'));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
