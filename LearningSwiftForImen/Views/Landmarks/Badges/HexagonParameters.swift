//
//  HexagonParameters.swift
//  LearningSwiftForImen
//
//  Created by Mohammad Saghafian on 2022-05-03.
//

import Foundation
//Importing coregraphics to use CGPoint
import CoreGraphics
// Create a HexagonParameters struct, a segment structure to hold three points that represent one side of the hexagon
struct HexagonParameters {
    struct Segment{
        // Each side starts where the previous ends, moves in a straight line to the first point, and then moves over a BeZier curve at the corner to the second point. The third point controls the shape of the curve
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    // Adjustment value that lets you tune the shape of the hexagon
    static let adjustment: CGFloat = 0.085
    // An array to hold the segments
    static let segments = [
        Segment(
                    line:    CGPoint(x: 0.60, y: 0.05),
                    curve:   CGPoint(x: 0.40, y: 0.05),
                    control: CGPoint(x: 0.50, y: 0.00)
                ),
                Segment(
                    line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
                    curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
                    control: CGPoint(x: 0.00, y: 0.25 + adjustment)
                ),
                Segment(
                    line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
                    curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
                    control: CGPoint(x: 0.00, y: 0.75 - adjustment)
                ),
                Segment(
                    line:    CGPoint(x: 0.40, y: 0.95),
                    curve:   CGPoint(x: 0.60, y: 0.95),
                    control: CGPoint(x: 0.50, y: 1.00)
                ),
                Segment(
                    line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
                    curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
                    control: CGPoint(x: 1.00, y: 0.75 - adjustment)
                ),
                Segment(
                    line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
                    curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
                    control: CGPoint(x: 1.00, y: 0.25 + adjustment)
                )
    
    ]
}
