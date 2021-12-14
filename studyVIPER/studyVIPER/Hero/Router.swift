//
//  Router.swift
//  studyVIPER
//
//  Created by Светлана on 14.12.2021.
//

import Foundation
import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
}

class HeroRouter: AnyRouter {
    
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = HeroRouter()
        
        // view, interactor, presenter
        
        var view: AnyView = HeroViewController()
        var presenter: AnyPresenter = HeroPresenter()
        var interactor: AnyInteractor = HeroInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    
}
