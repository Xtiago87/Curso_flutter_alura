
import 'package:bytebank_sqlite/components/container.dart';
import 'package:bytebank_sqlite/components/localization.dart';
import 'package:bytebank_sqlite/models/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_i18n.dart';
import 'dashboard_view.dart';

class DashboardContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit("Guilherme"),
      child: I18NLoadingContainer(
        viewKey : "dashboard",
        creator: (messages) => DashboardView(DashboardViewLazyI18N(messages)),
      ),
    );
  }
}
