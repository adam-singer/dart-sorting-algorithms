#source('Insertion.dart');
// http://algs4.cs.princeton.edu/

void main() {
  var a = "SORTEXAMPLE".splitChars();
  
  print('Printing list of string unsorted');
  Insertion.show(a);
  
  Insertion.sort(a);
  
  print('Printing list of string sorted');
  Insertion.show(a);
  
}
