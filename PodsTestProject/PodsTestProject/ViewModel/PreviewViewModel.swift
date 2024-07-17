//
//  PreviewViewModel.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import UIKit

final class PreviewViewModel: PreviewViewModelProtocol {

    // MARK: - Properties
    
    var pods: [Square] = []
  
    var podsModel: [PodsPreviewModel] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.didListUpdated?()
            }
        }
    }
    
    var didListUpdated: (() -> ())?
    
    private var podsService: PodsManagerProtocol
    private weak var router: PreviewFlowCoordinatorOutput?
   
    // MARK: - Init
    
    init(podsService: PodsManagerProtocol, router: PreviewFlowCoordinatorOutput) {
        self.podsService = podsService
        self.router = router
        fetchData()
    }
}

// MARK: - Public methods

extension PreviewViewModel {
    func fetchData() {
        Task {
            do {
                pods = try await self.podsService.getPodsList()
                
                for pod in pods {
                    guard 
                        let avatarUrlString = pod.owner.avatarUrl,
                        let avatarUrl = URL(string: avatarUrlString)
                    else {
                        throw URLError(.badURL)
                    }
                    
                    let icon = try await downloadImage(from: avatarUrl)
                    let model = PodsPreviewModel(
                        titleName: pod.name,
                        description: pod.description,
                        icon: icon
                    )
                    podsModel.append(model)
                }
            } catch {
                self.showAlert("Error", error.localizedDescription)
            }
        }
    }
    
    func showAlert(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in }
        alertController.addAction(okAction)
        DispatchQueue.main.async { [weak self] in
            self?.router?.trigger(.base(.alert(alertController)))
        }
    }
}

// MARK: - Private methods

private extension PreviewViewModel {
    func downloadImage(from url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            throw URLError(.cannotDecodeContentData)
        }
        return image
    }
}
