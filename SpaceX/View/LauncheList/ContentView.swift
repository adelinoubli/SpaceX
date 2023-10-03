//
//  ContentView.swift
//  SpaceX
//
//  Created by Adel on 9/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = LaunchViewModel()
    
    let strokedLine: some View = Line()
        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
        .frame(height: 1)
    var body: some View {
        
        NavigationView {
            ZStack{
                Spacer()
                
                ViewHeader()
                ScrollView(showsIndicators: false) {
                    
                    VStack(alignment: .center, spacing:  25) {
                        HStack {
                            Text("Upcoming flight")
                                .font(.system(size: 18))
                                .bold()
                                .kerning(0.29455)
                                .foregroundColor(Color(red: 0.03, green: 0.03, blue: 0.21))
                            strokedLine
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        NavigationLink(destination: DetailView()) {
                            ContentView.HorizontalScroll(height: 170, viewModel: viewModel)
                                .hiddenNavigationBarStyle()
                        }
                        
                        HStack {
                            Text("Old flight")
                                .font(.system(size: 18))
                                .bold()
                                .kerning(0.29455)
                                .foregroundColor(Color(red: 0.03, green: 0.03, blue: 0.21))
                            strokedLine
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        
                        ForEach(0..<6){ _ in
                            CollectionView()
                        }
                    }
                    .padding(EdgeInsets(top: 180, leading: 0, bottom: 16, trailing: 0))
                }
                .frame(maxWidth: .infinity)
            }
        }.task {
            do {
                let  _ = await viewModel.load()
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

extension ContentView {
    struct HorizontalScroll: View {
        var viewHeight: CGFloat = 0
        @ObservedObject var viewModel: LaunchViewModel
        
        init(height: CGFloat, viewModel: LaunchViewModel) {
            self.viewHeight = height
            self.viewModel = viewModel
        }
        
        var body: some View {
            ScrollView([.horizontal], showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(viewModel.launches, id: \.id) { launchItem in
                        WideRectangleCell(imageURL: launchItem.links.getThumbnailLink())
                    }
                    .padding(.leading, 20)
                }
            }
            .frame(height: viewHeight)
        }
    }
    
    struct CollectionView: View {
        var body: some View {
            VStack {
                HStack(spacing: 30) {
                    ForEach(0..<2) { _ in
                            
                        ZStack {
                            Image("airship")
                                .resizable()
                                .frame(width: 160, height: 160)
                                .overlay(
                                    Rectangle()
                                    .foregroundColor(.clear)
                                    .background(Color(red: 0.11, green: 0.11, blue: 0.11))
                                    .cornerRadius(4)
                                    .opacity(0.4)
                                )
                                .clipShape(Rectangle())
                                .cornerRadius(8)
                                .shadow(radius: 10)
                            
                            VStack {
                                Text("Lancement\nStarship")
                                    .font(.system(size: 20  ))
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .frame(width: 160, alignment: .top)
                                
                                Text("7 APRIL 2021")
                                    .font(.system(size: 12))
                                    .font(.system(size: 12))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .frame(width: 160, alignment: .bottom)
                            }
                            
                            
                        }.padding(.bottom, 16)
                           
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 22, bottom: 0, trailing: 22))
                .fixedSize(horizontal: false, vertical: false)
                
            }
        }
    }
    
    struct Line: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            return path
        }
    }
}

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
