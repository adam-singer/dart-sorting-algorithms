#source('Shell.dart');
void main() {

  var a = "SORTEXAMPLE".splitChars();
  
  print('Printing list of string unsorted');
  Shell.show(a);
  
  Shell.sort(a);
  
  print('Printing list of string sorted');
  Shell.show(a);
}
