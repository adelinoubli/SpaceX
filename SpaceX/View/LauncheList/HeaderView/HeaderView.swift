//
//  HeaderView.swift
//  SpaceX
//
//  Created by Adel on 9/22/23.
//

import SwiftUI

struct ViewHeader: View {
    var body: some View {
        Image("Header")
            .resizable()
            .scaledToFit()
            .edgesIgnoringSafeArea(.top)
            .frame(maxHeight: .infinity, alignment: .top)
            .zIndex(1)
    }
}
