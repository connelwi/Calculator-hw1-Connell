//
//  HW1_CalculatorTests.m
//  HW1 CalculatorTests
//
//  Created by Susan Linscheid on 2/2/15.
//  Copyright (c) 2015 edu.cudenver.csci.connell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface HW1_CalculatorTests : XCTestCase

@end

@implementation HW1_CalculatorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
