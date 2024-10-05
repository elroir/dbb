extension StringExtensions on String{
  bool isNumeric () {
    if (isEmpty) return false ;

    final formatted = replaceAll(',', '.');

    final n = num.tryParse(formatted);

    return (n == null) ? false : true;

  }
}