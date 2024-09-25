extension StringExtensions on String{
  bool isNumeric () {
    if (isEmpty) return false ;

    final n = num.tryParse(this);

    return (n == null) ? false : true;

  }
}