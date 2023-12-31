//
//  ViewController.swift
//  reMind.me
//
//  Created by Akihiro Nakano on 2023/12/30.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itemList:Results<TaskItem>!
    let realm = try! Realm()
    var token:NotificationToken!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        itemList = realm.objects(TaskItem.self).sorted(byKeyPath: "date")
        token = realm.observe{ notification, realm in
            // 変更があった場合にtableviewを更新
            self.tableView.reloadData()
        }
        
//        self.title = self.title! + ""
         setupNavigationBarTitle()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count //リストの数を設定する
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") //cellはStep2で指定した文字列
        let item = itemList[indexPath.row]
        cell?.textLabel?.text = item.title
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
        cell?.detailTextLabel?.text = formatter.string(from: item.date)
        return cell!
    }
    
    private func setupNavigationBarTitle() {
        title = "Re:mind"
        
        // titleをlargeにする
        //　navigationController?.navigationBar.prefersLargeTitles = true
        //　navigationItem.largeTitleDisplayMode = .always
        
        // LargeTitleのフォントを小さくする
        // setAppearanceForLargeTitleText()
        
        // navigationBarのタイトルを左寄せにする
        setNavigationBarLeftTitle("Re:mind")
        
    }
    
    private func setAppearanceForLargeTitleText() {
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label,
                                               .font: UIFont.systemFont(ofSize: 28, weight: .bold)]
        appearance.backgroundColor = .systemBackground
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    func setNavigationBarLeftTitle(_ title: String) {

        // titleViewとして設定したいUILabelのframeを設定する
        let titleLabel = UILabel(frame: CGRect(x: 4, y: 0, width: view.frame.width, height: 28))

        // 左寄せのタイトルを設定する
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 25, weight: .bold)
        titleLabel.textColor = .black

        // 生成したUILabelをtitleViewに設定する
        navigationItem.titleView = titleLabel
    }

}

