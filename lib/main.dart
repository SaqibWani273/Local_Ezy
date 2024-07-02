import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mca_project/data/repositories/customer/customer_profile_repository.dart';
import 'package:mca_project/presentation/features/customer/authentication/view_model/customer_auth_bloc.dart';
import '/presentation/common/theme/theme.dart';
import 'presentation/features/customer/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CustomerProfileRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CustomerAuthBloc(
                    customerProfileRepository:
                        RepositoryProvider.of<CustomerProfileRepository>(
                            context),
                  )),
        ],
        child: MaterialApp(
          title: 'MCA Project',
          theme: AppTheme,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        ),
      ),
    );
  }
}
