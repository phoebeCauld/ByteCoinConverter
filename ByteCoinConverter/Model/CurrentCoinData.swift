//
//  CurrentCoinData.swift
//  ByteCoinConverter
//
//  Created by F1xTeoNtTsS on 12.09.2021.
//

import Foundation


struct CurrentCoinData {
    init(currentCoinData: CoinData) {
        rate = currentCoinData.rate
    }
    
    let rate: Double
    var rateString: String {
        return String(format: "%.2f", rate)
    }
}
