//
//  SimpleListTests.m
//  SimpleListTests
//
//  Created by Paul Stringer on 01/09/2017.
//  Copyright © 2017 kiskynetmedia. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XYZTransaction.h"

@interface SimpleListTests : XCTestCase
@property XYZTransaction *transaction;
@end

@implementation SimpleListTests


- (void)setUp {
    [super setUp];
    _transaction = [[XYZTransaction alloc] init];
}

- (void)testCopyWithZoneDateIsCopy {
  
  XYZTransaction *copied = [_transaction copy];
  XCTAssertNotEqual(copied, _transaction);
  XCTAssertNotEqual(copied.date, _transaction.date);
  XCTAssertEqual([copied.date timeIntervalSinceDate:_transaction.date], 0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
