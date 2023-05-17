//
//  ShoppingItem.swift
//  RealmKakeibo
//
//  Created by 杉井位次 on 2023/05/17.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted var title: String = ""
    @Persisted var price: int = 0
    @Persisted var isMarked: Bool = false
}
