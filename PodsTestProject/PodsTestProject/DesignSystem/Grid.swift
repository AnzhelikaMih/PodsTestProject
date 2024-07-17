//
//  Grid.swift
//  PodsTestProject
//
//  Created by Анжелика on 10.07.24.
//

import Foundation

// MARK: - Grid

public enum Grid {
    
    // MARK: - Spacing
    
    public enum Spacing {
        public static let xs: CGFloat = 10.0
        public static let s: CGFloat = 15.0
        public static let m: CGFloat = 20.0
        public static let l: CGFloat = 25.0
        public static let xl: CGFloat = 50.0
    }
    
    // MARK: - Size
    
    public enum Size {
        public static let xs: CGSize = .init(squareSide: Spacing.xs)
        public static let s: CGSize = .init(squareSide: Spacing.s)
        public static let m: CGSize = .init(squareSide: Spacing.m)
        public static let l: CGSize = .init(squareSide: Spacing.l)
        public static let xl: CGSize = .init(squareSide: Spacing.xl)
    }
}
