//
//  CoinModel.swift
//  ByteCoinConverter
//
//  Created by F1xTeoNtTsS on 12.09.2021.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoinRate(_ coinManager: CoinManager, price: String, currency: String)
}

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "A3672902-AB57-4838-B0A6-F6BA75787644"
    
    
    var delegate: CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrise(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: url) { data, resp, error in
            if let error = error {
                print(error.localizedDescription)
            }
            if let safeData = data {
                if let coin = parseJSON(safeData){
                    let price = coin.rateString
                    self.delegate?.didUpdateCoinRate(self, price: price, currency: currency)
                }
            }
        }.resume()
    }
    
    
    func parseJSON(_ coinData:Data) -> CurrentCoinData?{
        let decoder = JSONDecoder()
        do {
           let decoded = try decoder.decode(CoinData.self, from: coinData)
            let currentCoinData = CurrentCoinData(currentCoinData: decoded)
            return currentCoinData
        } catch let jsonError {
            print(jsonError.localizedDescription)
            return nil
        }
    }
}
