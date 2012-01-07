class sortlibtests {
  run() {
    group('Sorting Tests ::', () {
      test('Bubble', () {
        var s = "shiuwtqxvfnlyopdkzgjbmcrae".splitChars();
        var d = "abcdefghijklmnopqrstuvwxyz".splitChars();
        Bubble.sort(s);
        expect(s).equalsCollection(d);
      });
      
      test('HeapSort', () {
        var s = "shiuwtqxvfnlyopdkzgjbmcrae".splitChars();
        var d = "abcdefghijklmnopqrstuvwxyz".splitChars();
        HeapSort.sort(s);
        expect(s).equalsCollection(d);
      });
      
      test('Insertion', () {
        var s = "shiuwtqxvfnlyopdkzgjbmcrae".splitChars();
        var d = "abcdefghijklmnopqrstuvwxyz".splitChars();
        Insertion.sort(s);
        expect(s).equalsCollection(d);
      });
      
      test('MergeSort', () {
        var s = "shiuwtqxvfnlyopdkzgjbmcrae".splitChars();
        var d = "abcdefghijklmnopqrstuvwxyz".splitChars();
        MergeSort.sort(s);
        expect(s).equalsCollection(d);
      });
      
      test('QuickSort', () {
        var s = "shiuwtqxvfnlyopdkzgjbmcrae".splitChars();
        var d = "abcdefghijklmnopqrstuvwxyz".splitChars();
        QuickSort.sort(s);
        expect(s).equalsCollection(d);
      });
      
      test('QuickSort3Way', () {
        var s = "shiuwtqxvfnlyopdkzgjbmcrae".splitChars();
        var d = "abcdefghijklmnopqrstuvwxyz".splitChars();
        QuickSort3Way.sort(s);
        expect(s).equalsCollection(d);
      });
      
      test('Selection', () {
        var s = "shiuwtqxvfnlyopdkzgjbmcrae".splitChars();
        var d = "abcdefghijklmnopqrstuvwxyz".splitChars();
        Selection.sort(s);
        expect(s).equalsCollection(d);
      });
      
      test('Shell', () {
        var s = "shiuwtqxvfnlyopdkzgjbmcrae".splitChars();
        var d = "abcdefghijklmnopqrstuvwxyz".splitChars();
        Shell.sort(s);
        expect(s).equalsCollection(d);
      });
      
    });
    
  }
}
