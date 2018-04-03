//
//  ViewController.swift
//  TodoSample
//
//  Created by Tomoyuki Ito on 2018/04/03.
//  Copyright © 2018 Tomoyuki Ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let dataStore = DataStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @IBAction func addButtonTouched() {
        let alert = createAlert()
        present(alert, animated: true, completion: nil)
    }
    
    private func createAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Todoの追加", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "入力してください"
        }
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "追加", style: .default, handler: { [weak self, weak alert] _ in
            let text = alert?.textFields?.first?.text ?? "???"
            self?.addItem(text: text)
        }))
        return alert
    }
    
    private func addItem(text: String) {
        dataStore.insertItem(text: text)
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.itemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataStore.item(index: indexPath.row)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
}
