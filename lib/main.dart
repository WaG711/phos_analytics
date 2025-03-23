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

/// 14 day > 24 week by 14 day > 12 months by 1 month > 1 year by half year

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
        routes: {
          "/": (context) => const Home(),
          "/details": (context) => const Details(),
        },
      ),
    );
  }
}
