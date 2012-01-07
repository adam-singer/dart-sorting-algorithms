//http://algs4.cs.princeton.edu/
//http://www.sorting-algorithms.com/quick-sort

//Algorithm
//# choose pivot
//swap a[1,rand(1,n)]
//
//# 2-way partition
//k = 1
//for i = 2:n, if a[i] < a[1], swap a[++k,i]
//swap a[1,k]
//-> invariant: a[1..k-1] < a[k] <= a[k+1..n]
//
//# recursive sorts
//sort a[1..k-1]
//sort a[k+1,n]

//Properties
//Not stable
//O(lg(n)) extra space (see discussion)
//O(n^2) time, but typically O(n*lg(n)) time
//Not adaptive

//Discussion
//When carefully implemented, quick sort is robust and 
//has low overhead. When a stable sort is not needed, 
//quick sort is an excellent general-purpose sort -- although 
//the 3-way partitioning version should always be used instead.
//
//The 2-way partitioning code shown above is written for clarity 
//rather than optimal performance; it exhibits poor locality, and, 
//critically, exhibits O(n^2) time when there are few unique keys. 
//A more efficient and robust 2-way partitioning method is given 
//in Quicksort is Optimal by Robert Sedgewick and Jon Bentley. 
//The robust partitioning produces balanced recursion when there 
//are many values equal to the pivot, yielding probabilistic guarantees 
//of O(n*lg(n)) time and O(lg(n)) space for all inputs.
//
//With both sub-sorts performed recursively, quick sort requires O(n) extra 
//space for the recursion stack in the worst case when recursion is not balanced. 
//This is exceedingly unlikely to occur, but it can be avoided by sorting the 
//smaller sub-array recursively first; the second sub-array sort is a tail 
//recursive call, which may be done with iteration instead. With this optimization, 
//the algorithm uses O(lg(n)) extra space in the worst case.

class QuickSort {

  // quicksort the array
  static void sort(List<Comparable> a) {
    _shuffle(a);
    _sortWithComparable(a, 0, a.length - 1);
  }
  
  // quicksort the subarray from a[lo] to a[hi]
  static void _sortWithComparable(List<Comparable> a, int lo, int hi) {
    if (hi <= lo) {
      return;
    }
    
    int j = _partition(a, lo, hi);
    _sortWithComparable(a, lo, j-1);
    _sortWithComparable(a, j+1, hi);
    assert(_isSortedInRange(a, lo, hi));
  }
  
  // partition the subarray a[lo .. hi] by returning an index j
  // so that a[lo .. j-1] <= a[j] <= a[j+1 .. hi]
  static int _partition(List<Comparable> a, int lo, int hi) {
    int i = lo;
    int j = hi + 1;
    Comparable v = a[lo];
    
    while (true) {
      
      // find item on lo to swap
      while (_less(a[++i], v)) {
        if (i==hi) {
          break;
        }
      }
      
      // find item on hi to swap
      while (_less(v, a[--j])) {
        if (j == lo) { // redundant since a[lo] acts as sentinel
          break; 
        }
      }
      
      // check if pointers cross
      if (i >= j) {
        break;
      }
      
      _exch(a, i, j);
    }
    
    // put v = a[j] into position
    _exch(a, lo, j);
    
    // with a[lo .. j-1] <= a[j] <= a[j+1 .. hi]
    return j;
  }
  
  static void _shuffle(List a) {
    int N = a.length;
    for (int i = 0; i<N; i++) {
      int r = i + (Math.random() * (N - i)).toInt();
      String swap = a[r];
      a[r] = a[i];
      a[i] = swap;
    }
  }
  /***********************************************************************
   *  Rearranges the elements in a so that a[k] is the kth smallest element,
   *  and a[0] through a[k-1] are less than or equal to a[k], and
   *  a[k+1] through a[n-1] are greater than or equal to a[k].
   ***********************************************************************/
  static Comparable select(List<Comparable> a, int k) {
    if (k < 0 || k >= a.length) {
      throw new Exception("Selected element out of bounds");
    }
    
    _shuffle(a);
    int lo = 0, hi = a.length - 1;
    while (hi > lo) {
      int i = _partition(a, lo, hi);
      if (i > k) {
        hi = i - 1;
      } else if (i < k) {
        lo = i + 1;
      } else {
        return a[i];
      }
    }
    return a[lo];
  
  }
  //Helper sorting functions
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
