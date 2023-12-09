//
//  ContentView.swift
//  formakersonly
//
//  Created by xcodeday on 12/8/23.
//

import SwiftUI

//struct SearchBar: View {
//    @Binding var text: String
//    
//    var body:
//        
//    }
extension Color {
    init(hex:UInt) {
        self.init(
            .sRGB,
            red: Double((hex & 0xFF0000) >> 16) / 255.0,
            green: Double((hex & 0x00FF00) >> 8) / 255.0,
            blue: Double(hex & 0x0000FF) / 255.0,
            opacity: 1.0
        )
    }
}

struct FontNameManager {
    struct Monsterrat {
        static let light = "Monterrat-light"
        static let regular = "Monteserrat-Regular"
        static let bold = "Monsterrat-ExtraBold"
    }
}
        
        let headerFont = Font.custom(FontNameManager.Monsterrat.bold, size: UIFont.preferredFont(forTextStyle:.largeTitle).pointSize)
        
        let websiteURL = "https://www.candlemakingsupplies.net/shop/vessel/14-oz-havana-champagne-candle-jar"
        let websiteURL2 = "https://www.candlemakingsupplies.net/shop/vessel/monticiano-clear-candle-vessel"

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0xede7df)
                    .ignoresSafeArea()
                
                VStack {

                    Text("TAYLOR CANDLE & CO").font(.headline)
                        .opacity(0.4)
                        .fontDesign(.serif)
                        .padding(0.5)
                    Text("FOR").font(.largeTitle)
                        .fontDesign(.default)
                    Text("MAKERS").font(.largeTitle)
                        .fontDesign(.default)
                    Text("ONLY").font(.largeTitle)
                        .fontDesign(.default)
                    Text("WHEN LIFE GIVES YOU").font(.headline)
                        .opacity(0.4)
                        .fontDesign(.serif)
                        .padding(0.5)
                    Text("WAX, WICK IT").font(.headline)
                        .opacity(0.4)
                        .fontDesign(.serif)
                    
                    NavigationLink(destination:ProductsView()) {
                        Text("VIEW PRODUCTS").font(.body)
                            .padding()
                            .fontDesign(.serif)
                            .foregroundStyle(.white)
                            .background(Color.black)
                            .cornerRadius(30)
                            .padding()
                    }
                }
            }
        }
    }
}

struct ProductsView: View {
    @State private var searchText = ""
    let allProducts = (1..<7).map {"Product \($0)"}
    
    var filteredProducts: [String] {
        if searchText.isEmpty {
            return allProducts
        } else {
            return allProducts.filter { $0.localizedCaseInsensitiveContains(searchText)}
        }
    }

    var body: some View {
        ZStack {
            Color(hex: 0xede7df)
                .ignoresSafeArea()
       
        VStack {
            //                SearchBar(Text: $searchText)
            Text("FULL PRODUCT LIST")
                .fontDesign(.serif)
                .font(.largeTitle)
                .foregroundColor(.black)
                .padding()
            
            let gridItems = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(filteredProducts, id: \.self) { product in
                        NavigationLink(destination: getPageViewForProduct(product)) {
                            VStack {
                                Spacer()
                                Image("image\(product.last!)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                
                                Text(product)
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                        }
                    }
                }
                .padding()
            }
        }
    }
    func getPageViewForProduct(_ product: String) -> some View {
        guard let productNumber = Int(String(product.last ?? "1")) else {
            return AnyView(EmptyView())
        }
        switch productNumber {
        case 1:
            return AnyView(Product1View())
        case 2:
            return AnyView(Product2View())
        case 3:
            return AnyView(Product3View())
        case 4:
            return AnyView(Product4View())
        case 5:
            return AnyView(Product5View())
        case 6:
            return AnyView(Product6View())
        default:
            return AnyView(EmptyView())
        }
    }
}



struct Product1View: View {
    var body: some View {
        Text("Product 1")
    }
}

struct Product2View: View {
    var body: some View {
        Text("Product 2")
    }
}
struct Product3View: View {
    var body: some View {
        Text("Product 3")
    }
}
struct Product4View: View {
    var body: some View {
        Text("Product 4")
    }
}
struct Product5View: View {
    var body: some View {
        Text("Product 5")
    }
}
struct Product6View: View {
    var body: some View {
        Text("Product 6")
    }
}




#Preview {
    ContentView()
}
