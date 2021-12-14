//
//  Presenter.swift
//  studyVIPER
//
//  Created by Светлана on 14.12.2021.
//

import Foundation

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchHeroes(with result: Result<[Heroes], Error>)
}

class HeroPresenter: AnyPresenter {
    
    var view: AnyView?
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getHeroes()
        }
    }
    
    func interactorDidFetchHeroes(with result: Result<[Heroes], Error>) {
        switch result {
        case .success(let heroes):
            view?.update(with: heroes)
        default:
            view?.update(with: "Something went wrong!")
        }
    }
    
}
