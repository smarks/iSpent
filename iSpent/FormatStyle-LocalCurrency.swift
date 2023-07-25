//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Paul Hudson on 06/11/2021.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
