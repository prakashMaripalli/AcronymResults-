////
////  Codables.swift
////  AcronymSurfing
////
////  Created by Prakash maripalli on 1/5/23.
////
//
//import Foundation
//
//
// MARK: - FullForm
struct Acronym: Codable {
    let sf: String
    let lfs: [LF]?
}

// MARK: - LF
struct LF: Codable {
    let lf: String
    let freq, since: Int
    let vars: [LF]?
}

typealias Acronyms = [Acronym]


