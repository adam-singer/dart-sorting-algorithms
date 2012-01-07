//http://algs4.cs.princeton.edu/
//http://www.sorting-algorithms.com/quick-sort-3-way

//Algorithm
//# choose pivot
//swap a[n,rand(1,n)]
//
//# 3-way partition
//i = 1, k = 1, p = n
//while i < p,
//  if a[i] < a[n], swap a[i++,k++]
//  else if a[i] == a[n], swap a[i,--p]
//  else i++
//end
//-> invariant: a[p..n] all equal
//-> invariant: a[1..k-1] < a[p..n] < a[k..p-1]
//
//# move pivots to center
//m = min(p-k,n-p+1)
//swap a[k..k+m-1,n-m+1..n]
//
//# recursive sorts
//sort a[1..k-1]
//sort a[n-p+k+1,n]

//Properties
//Not stable
//O(lg(n)) extra space
//O(n^2) time, but typically O(n*lg(n)) time
//Adaptive: O(n) time when O(1) unique keys

//Discussion
//The 3-way partition variation of quick sort has slightly higher overhead compared 
//to the standard 2-way partition version. Both have the same best, typical, 
//and worst case time bounds, but this version is highly adaptive in the very common 
//case of sorting with few unique keys.
//
//When stability is not required, 3-way partition quick sort is the general purpose 
//sorting algorithm of choice.
//
//The 3-way partitioning code shown above is written for clarity rather than optimal 
//performance; it exhibits poor locality, and performs more swaps than necessary. 
//A more efficient but more elaborate 3-way partitioning method is given in 
//Quicksort is Optimal by Robert Sedgewick and Jon Bentley.

class QuickSort3Way {

  // quicksort the array a[] using 3-way partitioning
  static void sort(List<Comparable> a) {
    _sortWithComparable(a, 0, a.length - 1);
    assert(_isSorted(a));
  }
  
  // quicksort the subarray a[lo .. hi] using 3-way partitioning
  static void _sortWithComparable(List<Comparable> a, int lo, int hi) {
    if (hi <= lo) {
      return;
    }
    
    int lt = lo, gt = hi;
    Comparable v = a[lo];
    int i = lo; 
    while(i <= gt) {
      int cmp = a[i].compareTo(v);
      if (cmp < 0) {
        _exch(a, lt++, i++);
      } else if (cmp > 0) {
        _exch(a, i, gt--);
      } else {
        i++;
      }
    }
    
    // a[lo..lt-1] < v = a[lt .. gt] < a[gt+1 .. hi].
    _sortWithComparable(a, lo, lt-1);
    _sortWithComparable(a, gt+1, hi);
    assert(_isSortedInRange(a, lo, hi));
    
  }
  
  // is v < w ?
  static bool _less(Comparable v, Comparable w) {
    return (v.compareTo(w) < 0);
  }
      
  // exchange a[i] and a[j] 
  static void _exch(List a, int i, int j) {
    var swap = a[i];
    a[i] = a[j];
    a[j] = swap;
  }
  
  // Check if array is sorted - useful for debugging
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
  
  // print to standard output
  static show(List<Comparable> a) {
    for (int i = 0; i < a.length; i++) {
      print(a[i]);
    }
  }
}
