#source('QuickSort.dart');
void main() {

  var a = "SORTEXAMPLE".splitChars();
  var b = "SORTEXAMPLE".splitChars();
  print('Printing list of string unsorted');
  QuickSort.show(a);
  
  QuickSort.sort(a);
  
  print('Printing list of string sorted');
  QuickSort.show(a);
  
  print('Printing list of string sorted by selecting');
  for (int i = 0; i < a.length; i++) {
    print("a: ${i} = ${QuickSort.select(a, i)}");
    print("b: ${i} = ${QuickSort.select(b, i)}");
  }
}
