//
//  Example.swift
//  NetworkRequestAPI
//
//  Created by Shakhnoza Mirabzalova on 12/23/25.
//

import Foundation

// 1, 2, fizz, 4, buzz,

struct Example {
    func checkingTest(num: Int) -> String {
        if num == 3 {
            return "fizz"
        } else if num == 5 {
            return "buzz"
        } else {
            return "\(num)"
        }
    }
}
