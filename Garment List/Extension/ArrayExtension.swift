//
//  ArrayExtension.swift
//  Garment List
//
//  Created by John N on 6/4/20.
//  Copyright © 2020 John Nguyen. All rights reserved.
//

import Foundation

extension Array {
    func sortedInsertionIndex(_ elem: Element, isOrderedBefore: (Element, Element) -> Bool) -> Int {
        var lo = 0
        var hi = self.count - 1
        while lo <= hi {
            let mid = (lo + hi)/2
            if isOrderedBefore(self[mid], elem) {
                lo = mid + 1
            } else if isOrderedBefore(elem, self[mid]) {
                hi = mid - 1
            } else {
                return mid
            }
        }
        return lo
    }
}
