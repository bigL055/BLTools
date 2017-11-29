//
//  Gcd.swift
//  BLTools
//
//  Created by bigl on 2017/10/15.
//

import Foundation

public struct Gcd {

  /// 原子锁
  ///
  /// - Parameters:
  ///   - lock: 被锁元素
  ///   - closure: 闭包
  public static func synchronzed(_ lock: Any, closure: ()->()){
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
  }

  /// 线程延时
  public static func sleep(_ time: Double,main:@escaping ()->()) {
    let time = DispatchTime.now() + .milliseconds(Int(time * 1000))
    DispatchQueue.main.asyncAfter(deadline: time) {
      main()
    }
  }

  /// 定时
  ///
  /// - Parameters:
  ///   - interval: 间隔
  ///   - keep: 持续时间, 小于0则会一直执行
  ///   - leeway: 精度, 默认 0.1
  ///   - event: 定时事件
  public static func `repeat`(interval: Double,
                              keep: Double = 0.0,
                              leeway: Double = 0.1,
                              event: @escaping ((_ timer: DispatchSourceTimer)->())) {
    let intervalTime = DispatchTimeInterval.milliseconds(Int(interval * 1000))
    let leewayTime = DispatchTimeInterval.milliseconds(Int(leeway * 1000))

    let queue = DispatchQueue.global()
    let timer = DispatchSource.makeTimerSource(flags: [], queue: queue)

    if keep > 0 {
      let keepTime = DispatchTime.now() + .milliseconds(Int(keep * 1000))
      queue.asyncAfter(deadline: keepTime) { timer.cancel() }
    }

    timer.schedule(deadline: .now(),
                   repeating: intervalTime,
                   leeway: leewayTime)

    timer.setEventHandler {
      DispatchQueue.main.async { event(timer) }
    }
    timer.resume()
  }
}

extension DispatchTime: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: Int) {
    self = DispatchTime.now() + .seconds(value)
  }
}

extension DispatchTime: ExpressibleByFloatLiteral {
  public init(floatLiteral value: Double) {
    self = DispatchTime.now() + .milliseconds(Int(value * 1000))
  }
}
