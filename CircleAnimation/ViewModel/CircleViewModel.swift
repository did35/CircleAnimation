//
//  CircleViewModel.swift
//  CircleAnimation
//
//  Created by Didier Delhaisse on 18/03/2022.
//

import Foundation
import Combine

class CircleViewModel: ObservableObject {
    
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var cancellables: AnyCancellable?
    
    func setUpTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    
    func cancelTimer() {
        cancellables?.cancel()
    }
}
