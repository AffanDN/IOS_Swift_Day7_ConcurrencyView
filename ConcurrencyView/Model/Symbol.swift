//
//  Symbol.swift
//  ConcurrencyView
//
//  Created by Macbook Pro on 22/04/24.
//

import Foundation

struct Symbol : Identifiable {
    let id = UUID()
    let name: String
}

extension Symbol {
    static var dummyData: [Symbol] {
        [
            Symbol(name: "keyboard"),
            Symbol(name: "hifispeaker.fill"),
            Symbol(name: "printer.fill"),
            Symbol(name: "tv.fill"),
            Symbol(name: "desktopcomputer"),
            Symbol(name: "headphones"),
            Symbol(name: "tv.music.note"),
            Symbol(name: "mic"),
            Symbol(name: "plus.bubble"),
            Symbol(name: "printer.dotmatrix"),
            Symbol(name: "scanner"),
            Symbol(name: "macpro.gen1"),
            Symbol(name: "pc"),
            Symbol(name: "macstudio"),
            Symbol(name: "flipphone"),
        ]
    }
}
