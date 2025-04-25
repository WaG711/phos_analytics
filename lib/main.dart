import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/details/data/api/details_api.dart';
import 'features/details/data/repositories/details_rpstr_impl.dart';
import 'features/details/domain/usecases/details_usecase.dart';
import 'features/details/presentation/bloc/details_bloc.dart';
import 'features/details/presentation/details.dart';
import 'features/home/data/api/home_api.dart';
import 'features/home/data/repositories/home_rpstr_impl.dart';
import 'features/home/domain/usecases/home_usecase.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) {
            final hApi = HomeApi();
            final hRepository = HomeRpstrImpl(api: hApi);
            final hUseCase = HomeUsecase(rpstr: hRepository);
            return HomeBloc(usecase: hUseCase);
          },
        ),
        BlocProvider<DetailsBloc>(
          create: (context) {
            final dApi = DetailsApi();
            final dRepository = DetailsRpstrImpl(api: dApi);
            final dUseCase = DetailsUsecase(rpstr: dRepository);
            return DetailsBloc(usecase: dUseCase);
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _buildAppTheme(),
        routes: {
          "/": (context) => const Home(),
          "/details": (context) => const Details(),
        },
      ),
    );
  }

  ThemeData _buildAppTheme() {
    final base = ThemeData.light();

    return base.copyWith(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF2E7D32),
        onPrimary: Colors.white,
        secondary: Color(0xFF66BB6A),
        onSecondary: Colors.black87,
        surface: Colors.white,
        onSurface: Colors.black87,
        error: Colors.red,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black87,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          textStyle: const TextStyle(fontSize: 14),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 2,
        margin: const EdgeInsets.all(4),
      ),
      textTheme: base.textTheme.copyWith(
        titleLarge: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        titleMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        bodyMedium: const TextStyle(fontSize: 14, color: Colors.black87),
        bodySmall: const TextStyle(fontSize: 10),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
