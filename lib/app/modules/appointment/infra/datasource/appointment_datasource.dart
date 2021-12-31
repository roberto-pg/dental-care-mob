abstract class IAppointmentDatasource {
  Future<String> makeAppointmentData(
      String scheduleId, String cpf, String plan, String card, bool scheduled);
}
