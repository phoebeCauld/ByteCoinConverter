//
//  ViewController.swift
//  ByteCoinConverter
//
//  Created by F1xTeoNtTsS on 11.09.2021.
//

import UIKit

class ViewController: UIViewController {
    let configView = ConfigView()
    var coinManager = CoinManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        configView.setView(view)
        configView.picker.dataSource = self
        configView.picker.delegate = self
        coinManager.delegate = self
    }

}


extension ViewController: CoinManagerDelegate{
    func didUpdateCoinRate(_ coinManager: CoinManager, price: String, currency: String) {
        DispatchQueue.main.async {
            self.configView.currencyLabel.text = currency
            self.configView.convertLabel.text = price
        }
    }

}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentCurrency = coinManager.currencyArray[row]
        configView.currencyLabel.text = currentCurrency
        coinManager.getCoinPrise(for: currentCurrency)
    }
}
