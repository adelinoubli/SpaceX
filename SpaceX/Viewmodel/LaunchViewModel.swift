//
//  LaunchViewModel.swift
//  SpaceX
//
//  Created by Adel on 9/18/23.
//

import Foundation
import UIKit


protocol LaunchesLoading {
    func load() async
}

class LaunchViewModel: ObservableObject,  LaunchesLoading{
        
    private lazy var networkService: NetworkService = {
        return NetworkService()
    }()
    
    @Published var launches =  Launches()
    
    @MainActor
    func load() async {
        do {
            self.launches = try await networkService.load(resource: Resources.LauncheResource.getList())
        } catch {
            guard let appError = error as? AppError else {
                    return
            }
            print(appError.errorDescription ?? "An error has  ocurred")
        }
    }
}

