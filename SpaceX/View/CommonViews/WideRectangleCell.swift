//
//  WideRectangleCell.swift
//  SpaceX
//
//  Created by Adel on 9/18/23.
//
import SwiftUI
import NukeUI


struct WideRectangleCell: View {
    
    var imageURL = ""
    @ViewBuilder var body: some View {
        
        ZStack(alignment: .bottom) {
            if imageURL.isEmpty {
                Image("airship")
                    .frame(width: 250, height: 180)
                    .cornerRadius(12)
            }
            else {
                LazyImage(url: URL(string: imageURL))
                    .frame(width: 250, height: 180)
                    .cornerRadius(12)
                
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 70, alignment: .bottom)
                    .background(.white)
                    .opacity(0.6)
                    .cornerRadius(4)
                
                VStack (alignment: .center) {
                    Text("Coming Text")
                        .font(.system(size: 18))
                        .bold()
                        .kerning(0.29455)
                        .foregroundColor(Color(red: 0.03, green: 0.03, blue: 0.21))
                    Text("Coming date")
                        .font(.system(size: 16))
                        .kerning(0.29455)
                        .autocapitalization(.allCharacters)
                        .foregroundColor(Color(red: 0.03, green: 0.03, blue: 0.21))
                }
            }
        }
    }
}

struct WideRectangleCell_Previews: PreviewProvider {
    static var previews: some View {
        WideRectangleCell()
    }
}
