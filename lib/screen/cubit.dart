// cubit/form_data_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:task/screen/db.dart';
import 'package:task/screen/model.dart';

class FormDataCubit extends Cubit<List<FormDataModel>> {
  final DatabaseService _databaseService;

  FormDataCubit(this._databaseService) : super([]);

  Future<void> fetchFormData() async {
    final data = await _databaseService.getFormData();
    emit(data);
  }

  Future<void> addFormData(FormDataModel formData) async {
    await _databaseService.insertFormData(formData);
    await fetchFormData(); // Refresh the data
  }

  Future<void> updateFormData(FormDataModel formData) async {
    await _databaseService.updateFormData(formData);
    await fetchFormData(); // Refresh the data
  }

  Future<void> deleteFormData(int id) async {
    await _databaseService.deleteFormData(id);
    await fetchFormData(); // Refresh the data
  }
}
