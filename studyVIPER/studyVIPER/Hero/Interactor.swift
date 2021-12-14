//
//  Interactor.swift
//  studyVIPER
//
//  Created by Светлана on 14.12.2021.
//

import Foundation

protocol AnyInteractor {
    
    var presenter: AnyPresenter? { get set }
    
    func getHeroes()
}

class HeroInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    
    func getHeroes() {
        
//        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession.shared
        let decoder = JSONDecoder()
        
        let urlString = "https://www.breakingbadapi.com/api/characters"
        
        guard let url = URL(string: urlString) else { return }
        
        session.dataTask(with: url) { [weak self] data, _ , error in
        
            guard let parseData = data, error == nil else {
                self?.presenter?.interactorDidFetchHeroes(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let resultData = try decoder.decode([Heroes].self, from: parseData)
                self?.presenter?.interactorDidFetchHeroes(with: .success(resultData))

            } catch let error {
                self?.presenter?.interactorDidFetchHeroes(with: .failure(error))
            }
        } .resume()
        
    }
    
}

