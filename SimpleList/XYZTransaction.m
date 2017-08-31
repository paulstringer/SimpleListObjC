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
  return [[XYZTransaction alloc] initWithDate:[_date copyWithZone:zone]];
}

@end
