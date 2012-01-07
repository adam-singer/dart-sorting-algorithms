//http://algs4.cs.princeton.edu/
//http://www.sorting-algorithms.com/merge-sort

//Algorithm
//# split in half
//m = n / 2
//
//# recursive sorts
//sort a[1..m]
//sort a[m+1..n]
//
//# merge sorted sub-arrays using temp array
//b = copy of a[1..m]
//i = 1, j = m+1, k = 1
//while i <= m and j <= n,
//    a[k++] = (a[j] < b[i]) ? a[j++] : b[i++]
//    -> invariant: a[1..k] in final position
//while i <= m,
//    a[k++] = b[i++]
//    -> invariant: a[1..k] in final position

//Properties
//Stable
//Theta(n) extra space for arrays (as shown)
//Theta(lg(n)) extra space for linked lists
//Theta(n*lg(n)) time
//Not adaptive
//Does not require random access to data

//Discussion
//Merge sort is very predictable. It makes between 0.5*lg(n) and lg(n) comparisons per 
//element, and between lg(n) and 1.5*lg(n) swaps per element. The minima are achieved 
//for already sorted data; the maxima are achieved, on average, for random data. 
//If using Theta(n) extra space is of no concern, then merge sort is an excellent choice: 
//It is simple to implement, and it is the only stable O(n*lg(n)) sorting algorithm. 
//Note that when sorting linked lists, merge sort requires only Theta(lg(n)) extra space (for recursion).
//
//Merge sort is the algorithm of choice for a variety of situations: when stability is required, 
//when sorting linked lists, and when random access is much more expensive than sequential access 
//(for example, external sorting on tape).
//
//There do exist linear time in-place merge algorithms for the last step of the algorithm, 
//but they are both expensive and complex. The complexity is justified for applications such as 
//external sorting when Theta(n) extra space is not available.

class MergeSort {

  static void sort(List<Comparable> a) {
    List<Comparable> aux = new List<Comparable>(a.length);
    sortHighLow(a, aux, 0, a.length-1);
    assert(_isSorted(a));
  }
  
  // merge sort a[lo..hi] using auxiliary list aux[lo..hi]
  static void sortHighLow(List<Comparable> a, List<Comparable> aux, int lo, int hi) {
    if (hi <= lo) {
      return;
    }
    
    int mid = lo + ((hi - lo) / 2).toInt();
    sortHighLow(a, aux, lo, mid);
    sortHighLow(a, aux, mid + 1, hi);
    merge(a, aux, lo, mid, hi);
  }
    
  // stably merge a[lo..mid] with a[mid+1..hi] using aux[lo..hi]
  static void merge(List<Comparable> a, List<Comparable> aux, int lo, int mid, int hi) {
    // precondition: a[lo .. mid] and a[mid+1 .. hi] are sorted subarrays
    assert(_isSortedInRange(a, lo, mid));
    assert(_isSortedInRange(a, mid+1, hi));

    // copy to aux[]
    for (int k = lo; k <= hi; k++) {
      aux[k] = a[k];
    }
    
    // merge back to a[]
    int i = lo, j = mid+1;
    for (int k = lo; k <= hi; k++) {
      if (i > mid) {
        a[k] = aux[j++];
      } else if (j > hi) {
        a[k] = aux[i++];
      } else if (_less(aux[j], aux[i])) {
        a[k] = aux[j++];
      } else {
        a[k] = aux[i++];
      }
    }
    
    // postcondition: a[lo .. hi] is sorted
    assert(_isSortedInRange(a, lo, hi));
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
  static void show(List<Comparable> a) {
    for (int i = 0; i < a.length; i++) {
      print(a[i]);
    }
  }
}
