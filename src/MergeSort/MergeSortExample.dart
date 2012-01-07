#source('MergeSort.dart');
void main() {
  
  var a = "SORTEXAMPLE".splitChars();
  
  print('Printing list of string unsorted');
  MergeSort.show(a);
  
  MergeSort.sort(a);
  
  print('Printing list of string sorted');
  MergeSort.show(a);
}
