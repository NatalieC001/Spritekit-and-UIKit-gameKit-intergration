#import "User.h"
#import "SocialNetwork.h"

static NSString* const kUserId    = @"userId";
static NSString* const kFirstName = @"firstName";
static NSString* const kLastName  = @"lastName";
static NSString* const kCity      = @"city";
static NSString* const kAvatar    = @"avatar";
static NSString* const kFemale    = @"female";

@implementation User

-(id)initWithCoder:(NSCoder*)decoder
{
    self = [super init];
    if (self) {
        self.key       = [decoder decodeObjectForKey:kKey];
        self.userId    = [decoder decodeObjectForKey:kUserId];
        self.firstName = [decoder decodeObjectForKey:kFirstName];
        self.lastName  = [decoder decodeObjectForKey:kLastName];
        self.city      = [decoder decodeObjectForKey:kCity];
        self.avatar    = [decoder decodeObjectForKey:kAvatar];
        self.female    = [decoder decodeBoolForKey:kFemale];
        
        //I added
        [self description];
        NSLog(@"User description @%@", [self description]);
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:self.key forKey:kKey];
    [encoder encodeObject:self.userId forKey:kUserId];
    [encoder encodeObject:self.firstName forKey:kFirstName];
    [encoder encodeObject:self.lastName forKey:kLastName];
    [encoder encodeObject:self.city forKey:kCity];
    [encoder encodeObject:self.avatar forKey:kAvatar];
    [encoder encodeBool:self.female forKey:kFemale];
}

-(void)save
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *archivedObject = [NSKeyedArchiver archivedDataWithRootObject:self];
    [defaults setObject:archivedObject forKey:self.key];
    [defaults synchronize];
}

-(void)reset
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:self.key];
    [defaults removeObjectForKey:kKey];
    [defaults synchronize];
}

+(NSArray*)keys
{
    static NSArray *_keys;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        _keys = @[kGC, kFB, kGG, kMR, kOK, kVK];
    });
    
    return _keys;
}

+(User*)load
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *key = [defaults objectForKey:kKey];
    if ([[User keys] containsObject:key] == NO)
        return nil;
    
    NSData *archived = [defaults objectForKey:key];
    if (!archived)
        return nil;
    
    User *user = (User *)[NSKeyedUnarchiver unarchiveObjectWithData:archived];
    return user;
}

+(User*)loadForKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[User keys] containsObject:key] == NO)
        return nil;
    
    NSData *archived = [defaults objectForKey:key];
    if (!archived)
        return nil;
    
    User *user = (User *)[NSKeyedUnarchiver unarchiveObjectWithData:archived];
    return user;
}

+(void)saveDefaultKey:(NSString*)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:key forKey:kKey];
    [defaults synchronize];
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"\n%@\n%@\n%@\n%@\n%@\n%@\n%hhd",
            self.key,
            self.userId,
            self.firstName,
            self.lastName,
            self.city,
            self.avatar,
            self.female];
}

@end
