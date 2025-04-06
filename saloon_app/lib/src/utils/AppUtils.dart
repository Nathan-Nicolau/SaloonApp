class AppUtils {

  static DateTime getDataAtualFormatada() {
    DateTime dataAtual = DateTime.now();
    dataAtual.toLocal();
    return dataAtual;
  }

}