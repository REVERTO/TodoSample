//
//  DataStore.swift
//  TodoSample
//
//  Created by Tomoyuki Ito on 2018/04/03.
//  Copyright © 2018 Tomoyuki Ito. All rights reserved.
//

import Foundation

class DataStore {
    
    typealias ItemType = String
    
    private var items: [ItemType] = []
    
    func insertItem(text: ItemType) {
        items.insert(text, at: 0)
    }
    
    func itemsCount() -> Int {
        return items.count
    }
    
    func item(index: Int) -> ItemType? {
        guard index >= 0, index < items.count else { return nil }
        return items[index]
    }
    
}
