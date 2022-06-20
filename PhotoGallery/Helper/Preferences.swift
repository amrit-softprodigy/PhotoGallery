//
//  Preferences.swift
//  PhotoGallery
//
//  Created by user on 17/03/22.
//

import Foundation

class Preferences {
    
    static let shared = Preferences()
    
    /*var favourites: [Int]? {
        get {
            UserDefaults.standard.value(forKey: "Favourite") as? [Int]
        }
    }
    */
    
    //MARK: Set Favourites
    private func setFavourite(_ id: String) {
        let favourites = UserDefaults.standard.value(forKey: "Favourite") as? [String]
        if var favourites = favourites  {
            if let index = favourites.firstIndex(where: { $0 == id }) {
                favourites.remove(at: index)
                UserDefaults.standard.set(favourites, forKey: "Favourite")
            } else {
                favourites.append(id)
                UserDefaults.standard.set(favourites, forKey: "Favourite")
            }
        } else {
            UserDefaults.standard.set([id], forKey: "Favourite")
        }
    }
    
    //MARK: Check favourite
    func isfavourite(for id: String) -> Bool {
        if let favourites = UserDefaults.standard.value(forKey: "Favourite") as? [String] {
            return favourites.contains(where: { $0 == id })
        }
        return false
    }
}
