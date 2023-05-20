//
//  CategoryViewController.swift
//  RealmKakeibo
//
//  Created by 杉井位次 on 2023/05/21.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var categories: [Category] = []
    var selectedCategory: Category? = nil //押されたセルのカテゴリーを保持

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self//データソースを自身のクラスを指定
        tableView.delegate = self
        categories = readCategories()
    }
    
    //セルの数はカテゴリーの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    //CategoryCellのラベルにcategory配列の◯番目の要素のタイトルを表示する
    func tabeleView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")!
        cell.textLabel?.text = categories[indexPath.row].title
        
        return cell
    }
    
    //セルが押されたら実行　押されたカテゴリーを代入して画面遷移する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        self.performSegue(withIdentifier: "toItemVoew", sender: nil)
    }
    
    //保存されているカテゴリーの記録を取り出して関数の呼び出し元に配列として返す関数
    func readCategories() -> [Category] {
        return Array(realm.objects(Category.self))
    }
    
    //Segueが発動される前に実行される
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toitemView" {
            let itemViewController = segue.destination as! ItemViewController
            //遷移先の変数にこの画面の値を代入
            itemViewController.selectedCategory = self.selectedCategory!
        }
    }
}
