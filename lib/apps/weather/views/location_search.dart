import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yesplay/apps/weather/bloc/weather_bloc.dart';

import '../../../core/widgets/btn.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({
    super.key,
  });

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final _locationCtrl = TextEditingController();

  @override
  void dispose() {
    _locationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _locationCtrl,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Location',
            ),
            onFieldSubmitted: (location) {
              context
                  .read<WeatherBloc>()
                  .add(SearchWeatherEvent(location: location));
            },
          ),
        ),
        const SizedBox(width: 15),
        Btn(
          label: 'Search',
          onPressed: () {
            context
                .read<WeatherBloc>()
                .add(SearchWeatherEvent(location: _locationCtrl.text));
          },
          size: const Size(130, 45),
          color: Theme.of(context).colorScheme.primary,
        )
      ],
    );
  }
}
