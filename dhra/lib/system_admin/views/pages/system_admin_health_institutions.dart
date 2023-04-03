//
//  system_admin_health_institutions
//  dhra
//
//  Created by Ngonidzashe Mangudya on 3/4/2023.
//  Copyright (c) 2023 ModestNerds, Co
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/configs.dart';
import '../../../core/views/widgets/page_header.dart';

class SystemAdminHealthInstitutionsPage extends StatelessWidget {
  const SystemAdminHealthInstitutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: context.height,
          width: context.width,
          color: UtanoColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: 'Health Institutions',
              ),
              SizedBox(
                height: sy(20),
              ),
            ],
          ),
        );
      },
    );
  }
}
