#import <Foundation/Foundation.h>

@interface XYZTransaction : NSObject <NSCopying>

@property (nonnull, readonly) NSDate *date;

- (nonnull id) initWithDate:(nonnull NSDate *)date;

@end
