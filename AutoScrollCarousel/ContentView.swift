//
//  ContentView.swift
//  AutoScrollCarousel
//
//  Created by Muhammet Emin Ayhan on 6.10.2024.
//

import SwiftUI

// Sample Model
struct Item: Identifiable {
    var id: String = UUID().uuidString
    var color: Color
}

var mockItems: [Item] = [
    .init(color: .red),
    .init(color: .blue),
    .init(color: .green),
    .init(color: .yellow),
    .init(color: .orange),
]

struct ContentView: View {
    @State private var activePage: Int = 0
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                CustomCarousel(activeIndex: $activePage) {
                    ForEach(mockItems) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(item.color.gradient)
                            .padding(.horizontal, 15)
                        
                    }
                }
                .frame(height: 220)
                
                // Custom Indicator
                HStack(spacing: 5) {
                    ForEach(mockItems.indices, id: \.self) { index in
                        Circle()
                            .fill(activePage == index ? .primary : .secondary)
                            .frame(width: 8, height: 8)
                    }
                }
                .animation(.snappy, value: activePage)
            }
            .navigationTitle("Auto Scroll Carousel")
        }
    }
}

#Preview {
    ContentView()
}
