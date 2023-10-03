//
//  DetailView.swift
//  SpaceX
//
//  Created by Adel on 10/2/23.
//

import SwiftUI

struct DetailView: View {
    
    var animation: Animation {
        Animation.easeOut(duration: 3)
    }
    
    @State private var isAnimated = false
    
    fileprivate func socialLinkButton() -> some View {
        return HStack (spacing: 8) {
            Image(systemName: "_iconName_")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.red) // Color for the icon
            
            Text("SpaceX")
                .font(.system(size: 12))
                .foregroundColor(.red) // Color for the text
        }
        .padding(12)
        .background(Color.clear)
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.red, lineWidth: 1)
        )
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .trailing){
                Image("Ciel")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: geometry.size.width * 0.9 , height: geometry.size.height * 0.9, alignment: .topLeading)
                    .offset(CGSize(width: geometry.size
                        .width * 0.3, height: -50))
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 78, height: 300)
                    .background(
                        Image("falcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 5, height: 8)
                            .scaleEffect(isAnimated ? 50 : 1)
                            .offset(x:  isAnimated ? -geometry.size.width  * 0.4 : 0, y: 20)
                            .animation(animation)
                    )
                
                VStack (alignment: .trailing, spacing: 30) {
                    Image("icon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 76, height: 65)
                        .clipped()
                    
                    Text("BIG\nFALCON\nROCKET")
                        .font(.system(size: 35))
                        .bold()
                        .multilineTextAlignment(.trailing)
                        .autocapitalization(.allCharacters)
                        .foregroundColor(.white)
                }
                
            }
            .offset(x: 30, y: -50)
            
        }
        .onAppear {
            self.isAnimated.toggle()
        }
        
        VStack() {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi arcu nunc, tincidunt quis felis vel, laoreet volutpat odio. Nam at erat convallis, vulputate sapien eget, scelerisque tortor. Aenean lectus tortor, sagittis id vulputate sit amet, pulvinar vitae augue. Aliquam semper sagittis turpis, eu tempor lorem vestibulum in. ")
            HStack(spacing: 40) {
                socialLinkButton()
                socialLinkButton()
            }
            
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
