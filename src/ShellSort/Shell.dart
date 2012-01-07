//http://algs4.cs.princeton.edu/
//http://www.sorting-algorithms.com/shell-sort

//Algorithm
//h = 1
//while h < n, h = 3*h + 1
//while h > 0,
//    h = h / 3
//    for k = 1:h, insertion sort a[k:h:n]
//    -> invariant: each h-sub-array is sorted
//end

//Properties
//Not stable
//O(1) extra space
//O(n^3/2) time as shown (see below)
//Adaptive: O(n*lg(n)) time when nearly sorted

//Discussion
//The worse-case time complexity of shell sort depends 
//on the increment sequence. For the increments 1 4 13 40 121..., 
//which is what is used here, the time complexity is O(n3/2). 
//For other increments, time complexity is known to be O(n4/3) and 
//even O(n*lg2(n)). Neither tight upper bounds on time complexity 
//nor the best increment sequence are known.
//
//Because shell sort is based on insertion sort, shell sort inherits 
//insertion sort's adaptive properties. The adapation is not as dramatic 
//because shell sort requires one pass through the data for each increment, 
//but it is significant. For the increment sequence shown above, there 
//are log3(n) increments, so the time complexity for nearly sorted data 
//is O(n*log3(n)).
//
//Because of its low overhead, relatively simple implementation, adaptive 
//properties, and sub-quadratic time complexity, shell sort may be a viable 
//alternative to the O(n*lg(n)) sorting algorithms for some applications 
//when the data to be sorted is not very large.

class Shell {

  // sort the list a in acending order using ShellSort
  static void sort(List<Comparable> a) {
    int N = a.length;
    
    // 3x+1 increment sequenece: 1, 4, 13, 40, 121, 364, 1093, ...
    int h = 1;
    while (h < (N/3).toInt()) {
      h = 3*h + 1;
    }
    
    while (h >= 1) {
      // h-sort the list
      for (int i = h; i < N; i++) {
        for (int j = i; j >= h && _less(a[j], a[j-h]); j -= h) {
          _exch(a, j, j-h);
        }
      }
      assert(_isHsorted(a,h));
      h = (h/3).toInt();
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
  
  // is the list h-sorted?
  static bool _isHsorted(List<Comparable> a, int h) {
    for (int i = h; i < a.length; i++) {
        if (_less(a[i], a[i-h]))  {
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
