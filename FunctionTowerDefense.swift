//
//  FunctionTowerDefense.swift
//  Swothie
//
//  Created by Passavee Losripat on 19/2/2567 BE.
//

import Foundation
import SwiftUI

func randomOpportunityData() -> otStructure {
    let amount = otData.count
    return otData[Int.random(in: 0..<amount/2)]
}

func randomThreatData() -> otStructure {
    let amount = otData.count
    return otData[Int.random(in: amount/2..<amount)]
}

func randomSpawnPoint(max: CGFloat, min:CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...1) * (max-min) + min
}

func renderImage<V: View>(from view: V, size: CGSize) -> UIImage? {
    let controller = UIHostingController(rootView: view)
    controller.view.bounds = CGRect(origin: .zero, size: size)
    controller.view.backgroundColor = .clear
    let renderer = UIGraphicsImageRenderer(size: size)
    return renderer.image { _ in
        controller.view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
    }
}

func +(left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func /(point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x / scalar, y: point.y / scalar)
}
