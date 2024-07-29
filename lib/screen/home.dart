import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:task/screen/cubit.dart';
import 'package:task/screen/model.dart';
import 'package:task/screen/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final FormGroup form = FormGroup({
    'date': FormControl<DateTime>(
      validators: [
        Validators.required,
      ],
    ),
    'time': FormControl<DateTime>(
      validators: [
        Validators.required,
      ],
    ),
    'staff': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'participants': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'budget': FormControl<String>(value: 'Yes'),
    'choice': FormControl<String>(value: 'Yes'),
    'reason': FormControl<String>(),
    'activity': FormControl<String>(value: 'Yes'),
    'noactivity': FormControl<String>(),
    'obj': FormControl<String>(value: 'Yes'),
    'noobj': FormControl<String>(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Validation Details'),
      ),
      body: ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Validation Details',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      TextWidget(
                        title: 'Date of visit',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ReactiveDateTimePicker(
                        formControlName: 'date',
                        decoration: const InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(),
                          helperText: '',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                      TextWidget(
                        title: 'Time of visit',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ReactiveDateTimePicker(
                        formControlName: 'time',
                        type: ReactiveDatePickerFieldType.time,
                        decoration: const InputDecoration(
                          labelText: 'Time',
                          border: OutlineInputBorder(),
                          helperText: '',
                          suffixIcon: Icon(Icons.watch_later_outlined),
                        ),
                      ),
                      TextWidget(
                        title:
                            '# of COMNet Staff Available in the Meeting\n / activity',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ReactiveTextField(
                        formControlName: 'staff',
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      TextWidget(
                        title:
                            '# of Participants available in the meeting \n/ activity',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ReactiveTextField(
                        formControlName: 'participants',
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(title: 'Budgeted / Non Budgeted'),
                      const SizedBox(
                        height: 5,
                      ),
                      ReactiveRadioListTile(
                        formControlName: 'budget',
                        value: 'Yes',
                        title: const Text('Yes'),
                      ),
                      ReactiveRadioListTile(
                        formControlName: 'budget',
                        value: 'No',
                        title: const Text('No'),
                      ),
                      TextWidget(
                          title:
                              'This activity was conducted as per the\n planned date & time'),
                      ReactiveRadioListTile(
                        formControlName: 'choice',
                        value: 'Yes',
                        title: const Text('Yes'),
                      ),
                      ReactiveRadioListTile(
                        formControlName: 'choice',
                        value: 'No',
                        title: const Text('No'),
                      ),
                      ReactiveValueListenableBuilder<String>(
                        formControlName: 'choice',
                        builder: (context, control, child) {
                          return control.value == 'No'
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 16),
                                    TextWidget(title: 'Reason'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const SizedBox(height: 8),
                                    ReactiveTextField(
                                      formControlName: 'reason',
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Reason',
                                      ),
                                      validationMessages: {
                                        ValidationMessage.required: (error) =>
                                            'Reason is required',
                                      },
                                    ),
                                  ],
                                )
                              : Container();
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(title: 'This activity achieved planned '),
                      const SizedBox(
                        height: 5,
                      ),
                      ReactiveRadioListTile(
                        formControlName: 'activity',
                        value: 'Yes',
                        title: const Text('Yes'),
                      ),
                      ReactiveRadioListTile(
                        formControlName: 'activity',
                        value: 'No',
                        title: const Text('No'),
                      ),
                      ReactiveValueListenableBuilder<String>(
                        formControlName: 'activity',
                        builder: (context, control, child) {
                          return control.value == 'No'
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 16),
                                    TextWidget(title: 'Reason'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const SizedBox(height: 8),
                                    ReactiveTextField(
                                      formControlName: 'noactivity',
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Reason',
                                      ),
                                      validationMessages: {
                                        ValidationMessage.required: (error) =>
                                            'Reason is required',
                                      },
                                    ),
                                  ],
                                )
                              : Container();
                        },
                      ),
                      TextWidget(
                          title: 'where the participant to support polio'),
                      const SizedBox(
                        height: 5,
                      ),
                      ReactiveRadioListTile(
                        formControlName: 'obj',
                        value: 'Yes',
                        title: const Text('Yes'),
                      ),
                      ReactiveRadioListTile(
                        formControlName: 'obj',
                        value: 'No',
                        title: const Text('No'),
                      ),
                      ReactiveValueListenableBuilder<String>(
                        formControlName: 'obj',
                        builder: (context, control, child) {
                          return control.value == 'No'
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 16),
                                    TextWidget(title: 'Reason'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const SizedBox(height: 8),
                                    ReactiveTextField(
                                      formControlName: 'noobj',
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Reason',
                                      ),
                                      validationMessages: {
                                        ValidationMessage.required: (error) =>
                                            'Reason is required',
                                      },
                                    ),
                                  ],
                                )
                              : Container();
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          if (form.valid) {
                            // Retrieve form data
                            final formData = FormDataModel(
                              date: form.control('date').value,
                              time: form.control('time').value,
                              staff: form.control('staff').value ?? '',
                              participants:
                                  form.control('participants').value ?? '',
                              budget: form.control('budget').value ?? '',
                              choice: form.control('choice').value ?? '',
                              reason: form.control('reason').value,
                              activity: form.control('activity').value ?? '',
                              noactivity: form.control('noactivity').value,
                              obj: form.control('obj').value ?? '',
                              noobj: form.control('noobj').value,
                            );

                            // Use the Cubit to save data
                            final cubit = context.read<FormDataCubit>();
                            await cubit.addFormData(formData);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Data saved successfully!'),
                                duration: Duration(seconds: 2),
                              ),
                            );

                            // Reset the form after submission
                            form.reset();
                          } else {
                            // Show an error message if the form is invalid
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please fill all required fields correctly.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
