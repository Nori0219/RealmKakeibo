//
//  ShoppingItem.swift
//  RealmKakeibo
//
//  Created by 杉井位次 on 2023/05/17.
//

import Foundation
import RealmSwift

class ShoppingItem: Object {
    @Persisted var title: String = ""//名前
    @Persisted var price: Int = 0//値段
    @Persisted var isMarked: Bool = false//重要な買い物かどうか
}
