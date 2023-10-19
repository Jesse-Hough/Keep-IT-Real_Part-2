//
//  DateFormatter+Extensions.swift
//  Keep-IT-Real
//
//  Created by Jesse Hough on 10/09/23.
//

import Foundation

extension DateFormatter {
    static var postFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
}
