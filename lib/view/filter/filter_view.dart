import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view/auth/widget/button_widget.dart';
import 'package:eproperty/view/auth/widget/field_widget.dart';
import 'package:eproperty/view/core/widget/widget.dart';
import 'package:eproperty/view_model/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterViewModelProvider = Provider<FilterViewModel>(
  (_) => FilterViewModel(),
);

class FilterView extends StatefulWidget {
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  List<ActionEntry> actions() {
    return [
      ActionEntry(
        event: const Loading(),
        action: (_) {
          LoadingHelper().show(CustomStrings.PLEASE_WAIT);
        },
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    context.read(filterViewModelProvider).initActions(actions());

    context.read(filterViewModelProvider).populate();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final ThemeData theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusHelper(context).unfocus();
      },
      child: Stack(
        children: <Widget>[
          CustomClipShadow(
            clipper: CustomClipperShape(),
            shadow: const Shadow(
              blurRadius: 24,
              color: CustomColors.blue,
            ),
            child: Container(
              height: height * 0.4,
              width: width,
              color: CustomColors.blue,
              child: Container(
                margin: const EdgeInsets.only(left: CustomSizes.MARGIN_24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Text(
                      CustomStrings.FILL_REQUIRED,
                      style: theme.textTheme.headline6.copyWith(
                        fontSize: CustomSizes.TEXT_SIZE_20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      CustomStrings.FILTER,
                      style: theme.textTheme.headline4.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(CustomSizes.PADDING_0),
            children: <Widget>[
              SizedBox(
                height: height * 0.45,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: CustomSizes.MARGIN_20,
                ),
                child: BuildForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildForm extends StatefulWidget {
  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final logInFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilder(
      key: logInFormKey,
      child: Column(
        children: [
          BuildField(
            type: 'text',
            attribute: 'companies',
            labelText: CustomStrings.COMPANY,
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ],
          ),
          const CustomSpaces(height: 8),
          BuildField(
            type: 'text',
            attribute: 'project',
            labelText: CustomStrings.PROJECT,
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.maxLength(24),
            ],
          ),
          const CustomSpaces(height: 12),
          Row(
            children: [
              const Spacer(),
              BuildButton(
                title: CustomStrings.DONE,
                theme: theme,
                onPressed: () {
                  FocusHelper(context).unfocus();

                  final formState = logInFormKey.currentState;

                  if (formState.saveAndValidate()) {
                    context
                        .read(filterViewModelProvider)
                        .request(formState.value);
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
