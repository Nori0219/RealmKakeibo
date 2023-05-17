//
//  ViewController.swift
//  RealmKakeibo
//
//  Created by 杉井位次 on 2023/05/17.
//

import UIKit
import RealmSwift

class ViewController: UIViewController ,UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()//Realmを扱うための宣言
    var items: [ShoppingItem] = []//shoppingItem型の配列を宣言
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DataSourceを継承したらセットで書く
        tableView.dataSource = self
        //カスタムセルをTableViewに登録
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItems()//取得した買い物の記録データをitemsに代入
    }
    
    //画面が表示されるときに実行されるメソッド
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()//items配列を最新の状態に更新
        tableView.reloadData()//TableViewのリロード
    }
    
    //表示するセルの数を指定する　要素数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //どんな内容のセルを表示するか指定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: ShoppingItem = items[indexPath.row]//◯行目の買い物データが入る
        cell.setCell(title: item.title, price: item.price, isMarked: item.isMarked)
        
        return cell
    }
    
    //戻り値が[ShoppingItem]型の関数（矢印の後が型）　配列として記録された値を返す
    func readItems() -> [ShoppingItem] {
        return Array(realm.objects(ShoppingItem.self))//returnの後が戻り値
    }
    
    
}

