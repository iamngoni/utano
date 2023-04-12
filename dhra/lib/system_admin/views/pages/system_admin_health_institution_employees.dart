//
//  system_admin_health_institution_employees
//  dhra
//
//  Created by Ngonidzashe Mangudya on 9/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/views/widgets/exception_widget.dart';
import '../../../core/views/widgets/loader_widget.dart';
import '../../../core/views/widgets/page_header.dart';
import '../../../general/blocs/navigation/navigation_bloc.dart';
import '../../blocs/health_institution_employees/health_institution_employees_bloc.dart';
import '../widgets/health_institution_employees_table.dart';
import '../widgets/no_health_institution_selected_widget.dart';

class SystemAdminHealthInstitutionEmployeesPage extends StatelessWidget {
  const SystemAdminHealthInstitutionEmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(
                title: 'Health Institution Employees',
                canGoBack: true,
                onGoBack: () =>
                    context.read<NavigationBloc>().add(const Navigate(1)),
              ),
              SizedBox(
                height: sy(20),
              ),
              Expanded(
                child: BlocBuilder<HealthInstitutionEmployeesBloc,
                    HealthInstitutionEmployeesState>(
                  builder: (context, state) {
                    late Widget child;

                    if (state is HealthInstitutionEmployeesLoading) {
                      child = const Center(
                        child: LoaderWidget(
                          color: UtanoColors.black,
                        ),
                      );
                    } else if (state is HealthInstitutionEmployeesError) {
                      child = ExceptionWidget(
                        error: state.error,
                        onRetry: () => context
                            .read<HealthInstitutionEmployeesBloc>()
                            .add(const ResetState()),
                      );
                    } else if (state is HealthInstitutionEmployeesLoaded) {
                      child = HealthInstitutionEmployeesTable(
                        healthInstitution: state.healthInstitution,
                        employees: state.employees,
                      );
                    } else {
                      child = const NoHealthInstitutionSelectedWidget();
                    }

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: child,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
