//
//  AddView.swift
//  iSpent
//
//  Original code created by Paul Hudson on 01/11/2021.
//  Extended by Spencer Marks starting on 07/25/2023
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var type = ExpenseType.necessary
    @State private var amount = 0.0
    @State private var notes = ""
    @State private var date = Date.now
    @State private var stringAmount = "0.0"

    let types = [ExpenseType.necessary, ExpenseType.discretionary]

    var disableSave: Bool {
        name.isEmpty
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        let label = "\($0)"
                        Text(label)
                    }
                }
                NumericTextField(numericText: $stringAmount, amountDouble: $amount)

                TextField("Notes", text: $notes)

                DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date) {
                    Text("Date")
                }
            }
            .navigationTitle("Add new expense")
            .toolbar {
               
                    Button("Cancel") {
                        dismiss()
                    }
                  
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount, note: notes, date: date)
                        expenses.items.append(item)
                        dismiss()
                    }.disabled(disableSave)
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
