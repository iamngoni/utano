import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../../../core/widgets/loader_widget.dart';
import '../../blocs/health_institutions/health_institutions_bloc.dart';

class HealthInstitutionsPage extends StatelessWidget {
  const HealthInstitutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(title: Text('Health Institutions')),
          body: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
            ),
            // body -> bloc builder for health institutions bloc
            child: BlocBuilder<HealthInstitutionsBloc, HealthInstitutionsState>(
              builder: (context, state) {
                if (state is HealthInstitutionsLoading) {
                  return Center(
                    child: LoaderWidget(),
                  );
                }

                if (state is HealthInstitutionsFailure) {
                  return Center(
                    child: GestureDetector(
                        onTap: () => context
                            .read<HealthInstitutionsBloc>()
                            .add(ListHealthInstitutions()),
                        child: Text(state.exception.message)),
                  );
                }

                if (state is HealthInstitutionsLoaded) {
                  return ListView(
                    children: state.healthInstitutions
                        .map((e) => ListTile(
                              tileColor:
                                  state.healthInstitutions.indexOf(e).isEven
                                      ? Colors.white
                                      : UtanoColors.light,
                              title: Text(
                                e.name,
                                style: TextStyle(
                                  color: UtanoColors.dark,
                                  fontWeight: FontWeight.w500,
                                  fontSize: sy(9),
                                ),
                              ),
                              subtitle: Text(
                                '📞 ${e.phoneNumber} 📍${e.address} 📧${e.email}',
                                style: TextStyle(
                                  color: UtanoColors.dark,
                                  fontWeight: FontWeight.w400,
                                  fontSize: sy(8),
                                ),
                              ),
                            ))
                        .toList(),
                  );
                }

                return SizedBox.shrink();
              },
            ),
          ),
        );
      },
    );
  }
}
