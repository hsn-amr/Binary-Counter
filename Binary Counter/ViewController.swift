//
//  ViewController.swift
//  Binary Counter
//
//  Created by administrator on 08/12/2021.
//

import UIKit

class ViewController: UIViewController, ShowTotal {
    
    var numbers = [Int]()
    
    var totalInt = 0

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createNumbers()
        tableView.dataSource = self
    }

    func showTotal(total: String) {
        totalInt = Int(total)!
        totalLabel.text = "Total: \(totalInt)"
    }
    
    func getTotal() -> Int {
        return totalInt
    }

    
    func createNumbers(){
        for i in 0...16 {
            numbers.append(Int(pow(10.0, Double(i))))
        }
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         as! NumbereViewCell
        cell.labelOfNumber.text = String(numbers[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    
}
