#import "XYZTransaction.h"

@implementation XYZTransaction

- (id)initWithDate:(NSDate*)date {
  if (self = [super init]) {
    _date = [date copy];
  }
  return self;
}

- (id)init {
  return [self initWithDate:[NSDate date]];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
  NSDate *copyDate = [[NSDate alloc] initWithTimeInterval:0 sinceDate:_date];
  return [[XYZTransaction alloc] initWithDate:copyDate];
}

@end
