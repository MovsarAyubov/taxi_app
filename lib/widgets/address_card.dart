// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:taxi_service_imitation/cubit/taxi_app_cubit.dart';

class AddressCard extends StatefulWidget {
  final TaxiAppCubit taxiAppCubit;
  const AddressCard({
    Key? key,
    required this.taxiAppCubit,
  }) : super(key: key);

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  var _currentStep = 0;

  static const _errorMessage1 = "Адрес должен иметь 5 символов и более";
  static const _errorMessage2 = "Это поле не может быть пустым";

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  final _fromWhereController = TextEditingController();
  final _whereController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Stepper(
            onStepTapped: (int index) {
              setState(() {
                _currentStep = index;
              });
            },
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep == 2) {
                FocusScopeNode currentFocus = FocusScope.of(context);

                currentFocus.unfocus();
              }
              if (_currentStep == 0) {
                _formKey1.currentState!.validate();
                if (_formKey1.currentState!.validate() == false) return;
              } else if (_currentStep == 1) {
                _formKey2.currentState!.validate();
                if (_formKey2.currentState!.validate() == false) return;
              } else if (_currentStep == 2) {
                _formKey3.currentState!.validate();
                if (_formKey3.currentState!.validate() == false) return;

                return;
              }

              if (_currentStep != 2) {
                setState(() {
                  _currentStep++;
                });
              }
            },
            onStepCancel: () {
              if (_currentStep != 0) {
                setState(() {
                  _currentStep--;
                });
              }
            },
            elevation: 8,
            steps: [
              Step(
                  title: const Text("Откуда?"),
                  content: MyFormField(
                      controller: _fromWhereController,
                      validator: (value) {
                        if (value!.split('').length < 5) {
                          return _errorMessage1;
                        }
                        return null;
                      },
                      globalKey: _formKey1,
                      onChanged: (_) {
                        widget.taxiAppCubit.setFromWhere(
                            fromWhere: _fromWhereController.text.toString());
                      },
                      taxiAppCubit: widget.taxiAppCubit)),
              Step(
                  title: const Text("Куда?"),
                  content: MyFormField(
                      controller: _whereController,
                      validator: (value) {
                        if (value!.split('').length < 5) {
                          return _errorMessage1;
                        }
                        return null;
                      },
                      globalKey: _formKey2,
                      onChanged: (_) {
                        widget.taxiAppCubit
                            .setWhere(where: _whereController.text.toString());
                      },
                      taxiAppCubit: widget.taxiAppCubit)),
              Step(
                  title: const Text("Ваше имя?"),
                  content: MyFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return _errorMessage2;
                        }
                        return null;
                      },
                      globalKey: _formKey3,
                      onChanged: (_) {
                        widget.taxiAppCubit.setClientName(
                            name: _nameController.text.toString());
                      },
                      taxiAppCubit: widget.taxiAppCubit)),
            ]),
      ]),
    );
  }
}

class MyFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final GlobalKey globalKey;
  final Function(String)? onChanged;
  final TaxiAppCubit taxiAppCubit;
  const MyFormField({
    Key? key,
    required this.controller,
    this.validator,
    required this.globalKey,
    required this.onChanged,
    required this.taxiAppCubit,
  }) : super(key: key);

  @override
  State<MyFormField> createState() => MyFormFieldState();
}

class MyFormFieldState extends State<MyFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        )),
      ),
    );
  }
}
