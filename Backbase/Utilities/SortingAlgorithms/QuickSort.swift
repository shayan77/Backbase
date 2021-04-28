//
//  QuickSort.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/28/21.
//

import Foundation

class QuickSort<T: Comparable> {
        
    public static func sort(_ items: [T]) -> [T] {
        var result = items
        result.shuffle()
        
        quickSort(array: &result, startIndex: 0, endIndex: items.count - 1)
        
        return result
    }
    
    private static func quickSort(array: inout [T], startIndex: Int, endIndex: Int) {
        // Base case
        if startIndex >= endIndex {
            return
        }
        let placedItemIndex = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
        quickSort(array: &array, startIndex: startIndex, endIndex: placedItemIndex-1)
        quickSort(array: &array, startIndex: placedItemIndex+1, endIndex: endIndex)
    }
    
    private static func partition(array: inout [T], startIndex: Int, endIndex: Int) -> Int {
        var q = startIndex
        for index in startIndex..<endIndex {
            if array[index] < array[endIndex] {
                array.swapAt(q, index)
                q += 1
            }
        }
        array.swapAt(q, endIndex)
        
        return q
    }
}
