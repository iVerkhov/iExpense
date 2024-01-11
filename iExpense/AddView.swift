//
//  AddView.swift
//  iExpense
//
//  Created by Игорь Верхов on 20.08.2023.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = "New expense"
    @State private var type = ""
    @State private var amount = 0.0
    
    let types = ["Personal", "Buiseness"]
    
    var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
//                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .localCurrency)
                    .keyboardType(.decimalPad)
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationTitle($name)
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
            
    }
}

#Preview {
    AddView(expenses: Expenses())
}
