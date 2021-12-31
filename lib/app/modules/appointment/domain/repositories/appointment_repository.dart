abstract class IAppointmentRepository {
  Future<String> makeAppointmentRepo(
      String scheduleId, String cpf, String plan, String card, bool scheduled);
}
