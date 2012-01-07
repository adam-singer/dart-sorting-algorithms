#source('Selection.dart');
void main() {

  var a = "SORTEXAMPLE".splitChars();
  
  print('Printing list of string unsorted');
  Selection.show(a);
  
  Selection.sort(a);
  
  print('Printing list of string sorted');
  Selection.show(a);
}
