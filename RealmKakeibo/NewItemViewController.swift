//
//  NewViewController.swift
//  RealmKakeibo
//
//  Created by 杉井位次 on 2023/05/17.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var markSwitsh: UISwitch!
    
    let realm = try! Realm()
    var category: Category!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save () {
        let item = ShoppingItem()//shoppingItemのインスタンスを作成
        //オプショナル型　??の後にデフォルトの値を入れる
        item.title = titleTextField.text ?? ""
        //Int()でnilになった時にエラーにならないように0をセット
        item.price = Int(priceTextField.text ?? "") ?? 0
        item.category = category
        item.isMarked = markSwitsh.isOn
        //それぞれのプロパティをセットしたらDBに登録
        createItem(item: item)
        
        let previousNC = self.presentingViewController as! UINavigationController
        let previousVC = previousNC.viewControllers[previousNC.viewControllers.count - 1] as! ItemViewController
        
        //前の画面に戻る
        self.dismiss(animated: true)
    }
    
    //引数としてshoppingItemを受け取る
    func createItem(item: ShoppingItem) {
        try! realm.write {
            realm.add(item)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
