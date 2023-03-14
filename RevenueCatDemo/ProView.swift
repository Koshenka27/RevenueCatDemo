//
//  ProView.swift
//  RevenueCatDemo
//
//  Created by Logan Koshenka on 3/14/23.
//

import SwiftUI
import RevenueCat

struct ProView: View {
    @State private var isSubscribed = false
    
    var body: some View {
        VStack {
            Text("Only subscribers can see this text")
                .blur(radius: isSubscribed ? 0 : 10)
        }
        .onAppear {
            checkSubscriptionStatus()
        }
    }
    
    func checkSubscriptionStatus() {
        Purchases.shared.getCustomerInfo { customerInfo, error in
            if let info = customerInfo {
                if info.entitlements["pro"]?.isActive == true {
                    // we are subscribed
                    print("SUBSCRIPTION ACTIVE")
                    isSubscribed = true
                }
            }
        }
    }
}

struct ProView_Previews: PreviewProvider {
    static var previews: some View {
        ProView()
    }
}
