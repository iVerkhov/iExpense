//
//  ContentView.swift
//  iExpense
//
//  Created by Игорь Верхов on 16.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var expenses = Expenses()
    
//    @State private var showingSheet = false
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .localCurrency)
                                .style(for: item)
                        }
                        .accessibilityElement()
                        .accessibilityLabel("\(item.name) \(item.amount.formatted(.currency(code: "USD")))")
                        .accessibilityHint(item.type)
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section("Buiseness") {
                    ForEach(expenses.items.filter { $0.type == "Buiseness" }) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            Text(item.amount, format: .localCurrency)
                                .style(for: item)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
//            .sheet(isPresented: $showingSheet) {
//                AddView(expenses: expenses)
//            }
            .toolbar {
                NavigationLink() {
                    AddView(expenses: expenses)
                } label: {
                    Label("Add expense", systemImage: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
