#source('Bubble.dart');

void main() {

 var a = "SORTEXAMPLE".splitChars();
  
  print('Printing list of string unsorted');
  Bubble.show(a);
  
  Bubble.sort(a);
  
  print('Printing list of string sorted');
  Bubble.show(a);
}
