//
//  ViewController.swift
//  reMind.me
//
//  Created by Akihiro Nakano on 2023/12/30.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.title = self.title! + ""
         setupNavigationBarTitle()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 //リストの数を設定する
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") //cellはStep2で指定した文字列
        cell?.textLabel?.text = "左に表示されるテキスト"
        cell?.detailTextLabel?.text = "右に表示されるテキスト"
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

