#source('HeapSort.dart');
void main() {

  var a = "SORTEXAMPLE".splitChars();
  
  print('Printing list of string unsorted');
  HeapSort.show(a);
  
  HeapSort.sort(a);
  
  print('Printing list of string sorted');
  HeapSort.show(a);
  
}
