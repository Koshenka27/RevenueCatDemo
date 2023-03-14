//
//  ContentView.swift
//  RevenueCatDemo
//
//  Created by Logan Koshenka on 3/14/23.
//

import SwiftUI
import RevenueCat

struct ContentView: View {
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertDescription = ""
    
    var body: some View {
        VStack {
            Text("Everyone can see this screen")
            
            Button {
                subscribe()
            } label: {
                Text("Subscribe")
                    .frame(width: 300, height: 50)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
            }

        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertDescription), dismissButton: .cancel())
        }
    }
    
    func subscribe() {
        Purchases.shared.getOfferings { offerings, error in
            if let packages = offerings?.current?.availablePackages {
                Purchases.shared.purchase(package: packages.first!) { transaction, purchaserInfo, error, userCancelled in
                    
                    if error != nil {
                        // handle error
                        alertTitle = "PURCHASE FAILED"
                        alertDescription = "Error: \(error!.localizedDescription)"
                        showAlert.toggle()
                    }
                    
                    if purchaserInfo?.entitlements["pro"]?.isActive == true {
                        // success
                        print("✅ PURCHASE SUCCESSFUL")
                        
                        alertTitle = "✅ PURCHASE SUCCESSFUL"
                        alertDescription = "You are now subscribed"
                        showAlert.toggle()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
