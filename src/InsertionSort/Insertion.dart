//http://algs4.cs.princeton.edu/
//http://www.sorting-algorithms.com/insertion-sort

//Algorithm
//for i = 2:n,
//    for (k = i; k > 1 and a[k] < a[k-1]; k--) 
//        swap a[k,k-1]
//    -> invariant: a[1..i] is sorted
//end

//Properties
//Stable
//O(1) extra space
//O(n^2) comparisons and swaps
//Adaptive: O(n) time when nearly sorted
//Very low overhead

//Discussion
//Although it is one of the elementary sorting algorithms with O(n2) 
//worst-case time, insertion sort is the algorithm of choice either 
//when the data is nearly sorted (because it is adaptive) or when the 
//problem size is small (because it has low overhead).
//
//For these reasons, and because it is also stable, insertion sort is 
//often used as the recursive base case (when the problem size is small) 
//for higher overhead divide-and-conquer sorting algorithms, such as 
//merge sort or quick sort.

class Insertion {

  // use natural order and Comparable interface
  static void sort(List<Comparable> a) {
    int N = a.length;
    for (int i=0; i<N; i++) {
      for (int j=i; j>0 && _less(a[j], a[j-1]); j--) {
        _exch(a, j, j-1);
      }
      assert(_isSortedInRange(a,0,i));
    }
    assert(_isSorted(a));
  }
  
  // use a custom order and Comparator interface
  static void sortWithComparer(List<Object> a, var c) {
    int N = a.length;
    for (int i = 0; i < N; i++) {
      for (int j = i; j > 0 && _lessWithComparer(c, a[j], a[j-1]); j--) {
        _exch(a, j, j-1);
      }
      assert(_isSortedInRange(a,0,i));
    }
    
    assert(_isSorted(a));
  }
  
  // return a permutation that gives the elements in a[] in ascending order
  // do not change the original list a[]
  static List<int> indexSort(List<Comparable> a) {
    int N = a.length;
    List<int> index = new List<int>();
    for (int i = 0; i < N; i++) {
      index.add(i);
    }
    
    for (int i = 0; i < N; i++) {
      for (int j = i; j > 0 && _less(a[index[j]], a[index[j-1]]); j--) {
        _exch(index, j, j-1);
      }
    }
    
    return index;
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
