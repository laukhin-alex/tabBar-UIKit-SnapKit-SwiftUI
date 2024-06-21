//
//  MarvelComicsViewModel.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 27.05.23.
//

import Combine
import Foundation
import OSLog

@MainActor
class MarvelComicsViewModel: ObservableObject {
    @Published var comics: [Comic] = []
    @Published var error: ApiErrorForAlert?
    @Published var isLoading: Bool = false
    var canLoad = true
    private var offset = 0
    private let limit = 20
    private var total = 55755
    private var cancellable: AnyCancellable?
    
    func fetch() {
        guard offset <= total else { return }
        guard canLoad == true else { return }
        canLoad = false
        isLoading = true

        cancellable = ComicsLogicController.shared.getComics(limit: limit, offset: offset)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in // MARK: first error handler
                switch completion {
                case .failure(let error):
                    if let apiError = error as? ApiErrorForAlert.UrlResponseErrors {
                        self.error = ApiErrorForAlert(message: apiError.rawValue)
                        self.isLoading = false
                    }
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.isLoading = false
                switch response.code {
                case 200:
                    let totalComics = response.data?.total // MARK: total number of comics from API
                    let count = response.data?.count // MARK: The total number of results returned by this call.,
                    self?.total = totalComics ?? 0 // MARK: total number of comics from API
                    Logger.viewCycle.log("\(totalComics ?? 0)")
                    Logger.viewCycle.log("\(count ?? 0)")
                    Logger.viewCycle.log("\(self?.comics.count.description ?? "")")
                    self?.comics.append(contentsOf: response.data?.results ?? [Comic(id: nil,
                                                                                     title: nil,
                                                                                     pageCount: nil,
                                                                                     thumbnail: nil,
                                                                                     variantDescription: nil,
                                                                                     description: nil,
                                                                                     images: nil)])
                    self?.offset += self?.limit ?? 0 // MARK: this is for the pagination
                    self?.canLoad = true
                default:
                    let error = ApiErrorForAlert.ApiStatusError(rawValue: response.status ?? "") ?? .unknown
                    self?.error = ApiErrorForAlert(message: error.description)
                }
                Logger.viewCycle.log("\(response.code ?? 0)")
                Logger.viewCycle.log("\(response.status ?? "")")
            })
    }
}
