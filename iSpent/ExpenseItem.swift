//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Paul Hudson on 01/11/2021.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}
