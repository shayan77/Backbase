//
//  SelectionSort.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/28/21.
//

import Foundation

class SelectionSort<T: Comparable> {
    
    public static func sort(_ items: [T]) -> [T] {
        var result = items
        
        let length = result.count
        
        for i in 0..<length {
            var minIndex = i
            for j in i+1..<length {
                if result[j] < result[minIndex] {
                    minIndex = j
                }
            }
            result.swapItems(itemAtIndex: i, withItemAtIndex: minIndex)
        }
        
        return result
    }
}
