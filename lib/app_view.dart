import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_dnt/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_dnt/screens/auth/auth_screen.dart';
import 'package:weather_app_dnt/screens/home/home_screen.dart';
import 'blocs/authentication_bloc/authentication_bloc.dart';


class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			title: 'Weather App DNT',
			theme: ThemeData(
				colorScheme: const ColorScheme.light(
          background: Colors.black,
          onBackground: Colors.white,
          primary: Color.fromRGBO(206, 147, 216, 1),
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(244, 143, 177, 1),
          onSecondary: Colors.white,
					tertiary: Color.fromRGBO(255, 204, 128, 1),
          error: Colors.red,
					outline: Color(0xFF424242)
        ),
			),
			home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
				builder: (context, state) {
					if(state.status == AuthenticationStatus.authenticated && WeatherBloc().state is WeatherInitial) {
						return  MultiBlocProvider(
							providers: [
								BlocProvider<WeatherBloc>(
									create: (context) => WeatherBloc(),
								)
							],
							child: const HomeScreen()
						);
					}
					else {
						return const AuthScreen();
					}
				}
			)
		);
  }
}