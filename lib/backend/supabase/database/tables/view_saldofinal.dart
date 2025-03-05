import '../database.dart';

class ViewSaldofinalTable
    extends SupabaseTable<ViewSaldofinalRow> {
  @override
  String get tableName => 'view_saldofinal';

  @override
  ViewSaldofinalRow createRow(Map<String, dynamic> data) =>
      ViewSaldofinalRow(data);
}

class ViewSaldofinalRow extends SupabaseDataRow {
  ViewSaldofinalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewSaldofinalTable();

  double get totalEntrada => getField<double>('total_entrada')!;
  set totalEntrada(double value) => setField<double>('total_entrada', value);

  double get totalSaida => getField<double>('total_saida')!;
  set totalSaida(double value) => setField<double>('total_saida', value);

  double get saldoFinal => getField<double>('saldo_final')!;
  set saldoFinal(double value) => setField<double>('saldo_final', value);
}
