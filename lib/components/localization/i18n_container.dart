import 'package:bytebank_sqlite/http/webclients/i18n_webclient.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../container.dart';
import '../localization.dart';

class I18NLoadingContainer extends BlocContainer {
  late I18NWidgetCreator creator;
  String? viewKey;

  I18NLoadingContainer({
    required String viewKey,
    required I18NWidgetCreator creator,
  }) {
    this.creator = creator;
    this.viewKey = viewKey;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<I18NMessagesCubit>(
      create: (BuildContext context) {
        final cubit = I18NMessagesCubit(this.viewKey.toString());
        cubit.reload(I18NWebClient(this.viewKey.toString()));
        return cubit;
      },
      child: I18NLoadingView(this.creator),
    );
  }
}
