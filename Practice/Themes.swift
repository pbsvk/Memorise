//
//  Themes.swift
//  Practice
//
//  Created by Bhaskara Sai Vamsi Krishna Padala on 10/27/24.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var emojis: [String]
    var color: Color
    var accentColor: Color
    var noOfPairs: Int?
}

let themes: [Theme] = [
    Theme(
        name: "Halloween",
        emojis: ["👻","🎃","🕷","🧟‍♂️","🧛🏼‍♀️","☠️","👽","🦹‍♀️","🦇","🌘","⚰️","🔮"],
        color: .orange,
        accentColor: .red,
        noOfPairs: 10),
    Theme(
        name: "Flags",
        emojis: ["🇸🇬","🇯🇵","🏴‍☠️","🏳️‍🌈","🇬🇧","🇹🇼","🇺🇸","🇦🇶","🇰🇵","🇭🇰","🇲🇨","🇼🇸"],
        color: .red,
        accentColor: .blue,
        noOfPairs: 10),
    Theme(
        name: "Animals",
        emojis: ["🦑","🦧","🦃","🦚","🐫","🦉","🦕","🦥","🐸","🐼","🐺","🦈"],
        color: .green,
        accentColor: .yellow,
        noOfPairs: 10),
    Theme(
        name: "Places",
        emojis: ["🗽","🗿","🗼","🎢","🌋","🏝","🏜","⛩","🕍","🕋","🏯","🏟"],
        color: .blue,
        accentColor: .green,
        noOfPairs: 10),
    Theme(
        name: "Sports",
        emojis: ["🤺","🏑","⛷","⚽️","🏀","🪂","🥏","⛳️","🛹","🎣","🏉","🏓"],
        color: .purple,
        accentColor: .orange,
        noOfPairs: 10),
    Theme(
        name: "Foods",
        emojis: ["🌮","🍕","🍝","🍱","🍪","🍩","🥨","🥖","🍟","🍙","🍢","🍿"],
        color: .yellow,
        accentColor: .red,
        noOfPairs: 10)
]

