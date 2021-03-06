
#import "CFCNetworkParamsUtil.h"

@implementation CFCNetworkParamsUtil

#pragma mark -
#pragma mark 参数空白字符串处理
+ (NSString *)makeStringWithNoWhitespaceAndNewline:(NSString *)value
{
    // 非空判断
    if (nil == value
        || [@"NULL" isEqualToString:value]
        || [value isEqualToString:@"<null>"]
        || [value isEqualToString:@"(null)"]
        || [value isEqualToString:@"null"]) {
        return CFC_PARAMS_NULL;
    }
    // 删除两端的空格和回车
    NSString *contentString = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return (nil == contentString || contentString.length == 0) ? CFC_PARAMS_NULL : contentString;
}

#pragma mark 公共请求参数的处理
+ (NSMutableDictionary *)makeRequestParameters:(NSMutableDictionary *)params
{
    NSMutableDictionary *PARAMETERS = @{
                                        @"token":CFC_PARAMS_NONNULL(APPINFORMATION.token),
                                        @"terminal_id":CFC_PARAMS_NONNULL(CFC_TERMINAL_IOS)
                                        }.mutableCopy;
    if (params) {
        [PARAMETERS setValuesForKeysWithDictionary:params];
    }
    return PARAMETERS;
}

#pragma mark -
#pragma mark 首页 - 获取数据
+ (NSMutableDictionary *)getHomeMainParameters
{
  NSMutableDictionary *PARAMETERS = @{
      @"next":CFC_PARAMS_NONNULL(@"next")
  }.mutableCopy;
  return CFC_PARAMS_MAKE(PARAMETERS);
}

#pragma mark 首页 - 获取数据（带参数）
+ (NSMutableDictionary *)getHomeMainRefreshParameters:(NSString *)param
{
  NSMutableDictionary *PARAMETERS = @{
      @"param":CFC_PARAMS_NONNULL(param)
  }.mutableCopy;
  return CFC_PARAMS_MAKE(PARAMETERS);
}


@end




