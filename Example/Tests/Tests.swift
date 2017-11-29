import UIKit
import XCTest
import BLTools

class Tests: XCTestCase {

  override func setUp() {
    super.setUp()
    BLCache.pathName = "com.bltools.www"
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    super.tearDown()
  }

  func testExample() {
    XCTAssert(true, "Pass")
  }

  func testCache() {
    BLCache.set(name: "value", value: "123456780", state: .memory)
    XCTAssert(BLCache.get(name: "value", default: "", state: .memory) == "123456780","fasle")

    BLCache.set(name: "value", value: "123456780", state: .userDefault)
    XCTAssert(BLCache.get(name: "value", default: "", state: .userDefault) == "123456780","fasle")

    BLCache.set(name: "value", value: "123456780", state: .sql(.cache))
    XCTAssert(BLCache.get(name: "value", default: "", state: .sql(.cache)) == "123456780","fasle")

    BLCache.set(name: "value", value: "123456780", state: .sql(.doc))
    XCTAssert(BLCache.get(name: "value", default: "", state: .sql(.doc)) == "123456780","fasle")

    BLCache.set(name: "value", value: "123456780", state: .sql(.tmp))
    XCTAssert(BLCache.get(name: "value", default: "", state: .sql(.tmp)) == "123456780","fasle")

//    BLCache.set(name: "value", value: "123456780", state: .keychain)
//    XCTAssert(BLCache.get(name: "value", default: "", state: .keychain) == "123456780","fasle")
  }

  func testGcdrepeat() {

  }

  func testGcdSleep() {
    measure() {
      Gcd.sleep(2) {
        self.waitForExpectations(timeout: 2) { (error) in
          assert(false, "超时" + error.debugDescription)
        }
      }
    }
  }

}
