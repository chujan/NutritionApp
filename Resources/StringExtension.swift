//
//  StringExtension.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
//struct Circle {
//   var Radius: Double
//   var Color: String
//   init() {
//       Radius = 1
//       Color = "red"
//       print("Circle1")
//       
//       print("Radius = ", Radius, "Color = ", Color)
//       
//   }
//   mutating func getArea(radius: Double, pi: Double) {
//        Radius = radius * radius * pi
//        
//        
//        print(Radius)
//       }
//       mutating func getCirmference(radius: Double, pi: Double) {
//        Radius = radius * 2 * pi
//        print(Radius)
//
//       }
//   init(Radius: Double) {
//       self.Radius = Radius
//       Color = "red"
//       print("Circl2")
//       print("Color = ", Color)
//       
//       
//   }
//   mutating func cal(radius: Double)  {
//    Radius = radius
//    print(Radius)
//    
//      
//   }
//   mutating func getArea2(radius: Double, pi: Double) {
//        Radius = radius * radius * pi
//        
//        
//        print(Radius)
//       }
//       mutating func getArea3(radius: Double, pi: Double) {
//        Radius = radius * radius * pi
//        
//        
//        print(Radius)
//       }
//       mutating func getCirmference2(radius: Double, pi: Double) {
//        Radius = radius * 2 * pi
//        print(Radius)
//
//       }
//       mutating func getCirmference3(radius: Double, pi: Double) {
//        Radius = radius * 2 * pi
//        print(Radius)
//
//       }
//
//       
//   
//   init(Radius:Double, Color: String) {
//    
//       self.Radius = Radius
//       self.Color = Color
//      
//   }
//   
//   mutating func getRed(color: String) {
//    print("Circle3")
//    print("color")
//    
//    Color = color
//    
//    print(Color)
//   }
//   
//    
//
//}
//var Radius = Circle()
//print("Area")
//Radius.getArea(radius: 1, pi: Double.pi)
//print("circumference")
//Radius.getCirmference(radius: 1, pi:Double.pi )
//
// var g = Circle(Radius:2)
// print("Area")
// g.getArea2(radius: 2, pi: Double.pi )
// print("circumference")
//  g.getCirmference2(radius:2, pi: Double.pi)
//  print("radius")
//   g.cal(radius: 2)
//   
//   g.getRed(color: "blue")
//   
//   print("Area")
//   g.getArea3(radius: 2, pi: Double.pi)
//   print("circumference")
//   g.getCirmference3(radius: 2, pi: Double.pi)
//   print("radius")
//   g.cal(radius: 2)
//   
