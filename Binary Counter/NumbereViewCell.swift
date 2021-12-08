//
//  NumbereViewCell.swift
//  Binary Counter
//
//  Created by administrator on 08/12/2021.
//

import UIKit

protocol ShowTotal {
    func showTotal(total: String)
    
    func getTotal() -> Int
}
class NumbereViewCell: UITableViewCell {

    var delegate: ShowTotal?
    
    @IBOutlet weak var labelOfNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func minusButtonPressed(_ sender: UIButton) {
        let number = Int(labelOfNumber.text!) ?? 0
        var total = delegate?.getTotal() ?? 0
        total -= number
        delegate?.showTotal(total: String(total))
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        let number = Int(labelOfNumber.text!) ?? 0
        var total = delegate?.getTotal() ?? 0
        total += number
        delegate?.showTotal(total: String(total))
        print("number - \(total)")
    }
    
}
