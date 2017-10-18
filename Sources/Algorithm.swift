//
//  Math.swift
//  BLTools
//
//  Created by bigl on 2017/10/18.
//

import UIKit

struct Algorithm {

  func distance(lat1: Double, lng1: Double,lat2 : Double, lng2: Double) -> Double {
    let RAD = Double.pi / 180
    let dx = lng1 - lng2 // 经度差值
    let dy = lat1 - lat2 // 纬度差值
    let b = (lat1 + lat2) / 2.0 // 平均纬度
    let Lx = dx * RAD * 6367000.0 * cos(b * RAD) // 东西距离
    let Ly = 6367000.0 * dy * RAD// 南北距离
    return sqrt(Lx * Lx + Ly * Ly) // 用平面的矩形对角距离公式计算总距离
  }

}
