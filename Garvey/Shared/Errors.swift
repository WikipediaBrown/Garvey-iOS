//
//  Errors.swift
//  Garvey
//
//  Created by Wikipedia Brown on 7/1/19.
//  Copyright © 2019 IamGoodBad. All rights reserved.
//

import Foundation

enum ImageError: LocalizedError {
    case cannotCreateImageFromData

    var errorDescription: String? {
        switch self {
        case .cannotCreateImageFromData:
            return Strings.cannotCreateImageFromData
        }
    }
}
