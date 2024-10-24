//
//  ContentView.swift
//  TipCalculator
//
//  Created by apple on 19/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount = ""
    @State private var tipPercentage = 15.0
    
    var totalTip : Double {
        let bill = Double(self.billAmount) ?? 0
        let tip = bill * self.tipPercentage / 100
        return tip
    }
    
    var totalAmount: Double {
        let bill = Double(self.billAmount) ?? 0
        return bill + self.totalTip
    }
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image("tip-calc-picture")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .clipped()
            
            Spacer()
            
            TextField("Enter bill amount", text: $billAmount)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Text("Tip Percentage: \(Int(tipPercentage))%")
                .font(.headline)
            
            Slider(value: $tipPercentage, in: 0...30, step: 1)
                .accentColor(.blue)
                .padding(.horizontal)
            
            Text("Total Tip: $\(totalTip, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.green)
            
            Text("Total Amount: $\(totalAmount, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.blue)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
