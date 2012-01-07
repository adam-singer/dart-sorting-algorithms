#source('QuickSort3Way.dart');
void main() {
  var a = "SORTEXAMPLE".splitChars();
  
  print('Printing list of string unsorted');
  QuickSort3Way.show(a);
  
  QuickSort3Way.sort(a);
  
  print('Printing list of string sorted');
  QuickSort3Way.show(a);
}
