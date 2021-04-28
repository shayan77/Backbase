//
//  Array+Extensions.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/28/21.
//

import Foundation

extension Array where Element: Comparable {
    
    public func selectionSorted() -> [Element] {
        return SelectionSort.sort(self)
    }
    
    public func insertionSortedSwaps() -> [Element] {
        return InsertionSort.sort(self)
    }
    
    public func insertionSortedShifts() -> [Element] {
        return InsertionSort.sortWithShifting(self)
    }

    public func mergeSorted() -> [Element] {
        return MergeSort.sort(self)
    }

    public func quickSorted() -> [Element] {
        return QuickSort.sort(self)
    }
}

extension Array {
    
    public mutating func swapItems(itemAtIndex firstIndex: Index, withItemAtIndex secondIndex: Index) {
        
        if firstIndex != secondIndex {
            self.swapAt(firstIndex, secondIndex)
        }
    }
    
    public mutating func shuffle() {
        
        for i in 0..<count {
            self.swapItems(itemAtIndex: i, withItemAtIndex: Array.Index(arc4random_uniform(UInt32(count))))
        }
    }
}
