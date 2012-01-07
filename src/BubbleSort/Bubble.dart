//http://algs4.cs.princeton.edu/
//http://www.sorting-algorithms.com/bubble-sort

//Algorithm
//for i = 1:n,
//    swapped = false
//    for j = n:i+1, 
//        if a[j] < a[j-1], 
//            swap a[j,j-1]
//            swapped = true
//    -> invariant: a[1..i] in final position
//    break if not swapped
//end

//Properties
//Stable
//O(1) extra space
//O(n^2) comparisons and swaps
//Adaptive: O(n) when nearly sorted

//Discussion
//Bubble sort has many of the same properties as insertion sort, 
//but has slightly higher overhead. In the case of nearly sorted 
//data, bubble sort takes O(n) time, but requires at least 2 passes 
//through the data (whereas insertion sort requires something more like 1 pass).

class Bubble {

  // bubble sort
  static void sort(List<Comparable> a) {
    bool swapped = true;
    while (swapped) {
      swapped = false;  // assume this is last pass over array
      for (int i=0; i<a.length-1; i++) {
        if (_less( a[i+1], a[i])) {
             // exchange elements
            _exch(a, i, i+1);
            swapped = true;  // after an exchange, must look again    
        }
      }
    }
    
    assert(_isSorted(a));
  }
  
  // use a custom order and Comparator interface 
  static void sortWithComparer(List<Object> a, var c) {   
    bool swapped = true;
    while (swapped) {
      swapped = false;  // assume this is last pass over array
      for (int i=0; i<a.length-1; i++) {
        if (_lessWithComparer(c, a[i+1], a[i])) {
            // exchange elements
            _exch(a, i, i+1);
            swapped = true;  // after an exchange, must look again   
        }
      }
    }
    assert(_isSorted(a));
  }
  
  //
  // Helper sorting functions
  // 
  
  // is v < w ?
  static bool _less(Comparable v, Comparable w) {
    return (v.compareTo(w) < 0);
  }
  
  // is v < w ?
  static bool _lessWithComparer(var c, Object v, Object w) {
    return (c.compareTo(v,w) < 0);
  }
  
  // exchange a[i] and a[j] 
  static void _exch(List a, int i, int j) {
    var swap = a[i];
    a[i] = a[j];
    a[j] = swap;
  }
  
  //
  // Check list is sorted - useful for debugging
  //
  // is the list sorted
  static bool _isSorted(List<Comparable> a) {
    return _isSortedInRange(a, 0, a.length-1);
  }
  
  // is the list sorted from a[lo] to a[hi]
  static bool _isSortedInRange(List<Comparable> a, int lo, int hi) {
    for (int i= lo + 1; i <= hi; i++) {
      if (_less(a[i], a[i-1])) {
        return false;
      }
    }
    
    return true;
  }
  
  // is the list sorted from a[lo] to a[hi]
  static bool _isSortedInRangeWithComparer(List<Object> a, var c, int lo, int hi) {
    for (int i = lo + 1; i <= hi; i++) {
      if (_lessWithComparer(c, a[i], a[i-1])) {
        return false;
      }
    }
    
    return true;
  }
  
  // print to standard output
  static show(List<Comparable> a) {
    for (int i = 0; i < a.length; i++) {
      print(a[i]);
    }
  }
}

