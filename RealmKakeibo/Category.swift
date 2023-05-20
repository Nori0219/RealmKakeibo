//
//  Category.swift
//  RealmKakeibo
//
//  Created  on 2023/05/21.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var title: String = ""
}
