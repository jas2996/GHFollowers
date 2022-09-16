//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Jas Lamba on 2022-03-27.
//

import Foundation

//accociate values, have type for each case
//enum Barcode {
//    case upc(Int, Int, Int, Int)
//    case qrCode(String)
//}

//raw value, have type for all case of one type
//enum ASCIIControlCharacter: Character {
//    case tab = "\t"
//    case lineFeed = "\n"
//    case carriageReturn = "\r"
//}

enum GFError: String, Error {
    case invalidUsername = "This username created an invalide request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "Data recieved from server is invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this error."
    case alredyInFavorites = "alredyInFavorites"
}
