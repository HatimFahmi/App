//
//  PageView.swift
//  TestAPP
//
//  Created by Fahmi Abbas on 09/03/2022.
//
import Foundation
import SwiftUI

class PageView: ObservableObject{
    @Published var currentPage: Page = .home
    
}

enum Page{
    case home
    case add
    case contact
}
