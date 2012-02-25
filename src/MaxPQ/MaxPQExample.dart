#source('MaxPQ.dart');

void main() {
  MaxPQ<String> pq = new MaxPQ<String>();
  
  String s = "P Q E - X A M - P L E -";
  List l = s.split(" ");
  l.forEach((var _s) {
    if (_s != "-") {
      pq.insert(_s);
    } else if (!pq.isEmpty()) {
      print(pq.delMax() + " ");
    }
  });
  
  print("(" + pq.size() + " left on pq)");
}
