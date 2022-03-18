//
//  ContentView.swift
//  CircleAnimation
//
//  Created by Didier Delhaisse on 18/03/2022.
//

import SwiftUI

struct CircleView: View {
    // MARK: - Properties
    @StateObject var vm = CircleViewModel()
    @State private var isScalable = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .scaleEffect(isScalable ? 0.8 : 1)
                .frame(width: 200, height: 200)
                .foregroundColor(isScalable ? .green : .red)
                .animation(.linear(duration: 1), value: isScalable)
                .onReceive(vm.publisher) { _ in
                    isScalable = false
                    vm.cancelPublisher()
                }
                .padding(.vertical, 50)
            Button ("Animate me!") {
                isScalable = true
                vm.startPublisher()
            }
            Spacer()
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
