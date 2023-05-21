//
//  NewCategoryViewController.swift
//  RealmKakeibo
//
//  Created by  on 2023/05/21.
//

import UIKit
import RealmSwift

class NewCategoryViewController: UIViewController {
    
    @IBOutlet var categoryTextField: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        let category = Category()
        category.title = categoryTextField.text ?? ""
        createCategory(category: category)
        
        self.dismiss(animated: true)
    }
    
    func createCategory(category: Category) {
        try! realm.write {
            realm.add(category)
        }
    }
    
    
}
