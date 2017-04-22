//
// Generated by CocoaPods-Keys
// on 22/04/2017
// For more information see https://github.com/orta/cocoapods-keys
//

#import <objc/runtime.h>
#import <Foundation/NSDictionary.h>
#import "IosGurunaviDemoKeys.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation IosGurunaviDemoKeys

  @dynamic keyid;

#pragma clang diagnostic pop

+ (BOOL)resolveInstanceMethod:(SEL)name
{
  NSString *key = NSStringFromSelector(name);
  NSString * (*implementation)(IosGurunaviDemoKeys *, SEL) = NULL;

  if ([key isEqualToString:@"keyid"]) {
    implementation = _podKeys9d2f62b90efdf2293d7138e1ce176547;
  }

  if (!implementation) {
    return [super resolveInstanceMethod:name];
  }

  return class_addMethod([self class], name, (IMP)implementation, "@@:");
}

static NSString *_podKeys9d2f62b90efdf2293d7138e1ce176547(IosGurunaviDemoKeys *self, SEL _cmd)
{
  
    
      char cString[33] = { IosGurunaviDemoKeysData[83], IosGurunaviDemoKeysData[989], IosGurunaviDemoKeysData[618], IosGurunaviDemoKeysData[493], IosGurunaviDemoKeysData[161], IosGurunaviDemoKeysData[754], IosGurunaviDemoKeysData[612], IosGurunaviDemoKeysData[705], IosGurunaviDemoKeysData[933], IosGurunaviDemoKeysData[494], IosGurunaviDemoKeysData[1174], IosGurunaviDemoKeysData[755], IosGurunaviDemoKeysData[1072], IosGurunaviDemoKeysData[320], IosGurunaviDemoKeysData[814], IosGurunaviDemoKeysData[629], IosGurunaviDemoKeysData[1095], IosGurunaviDemoKeysData[546], IosGurunaviDemoKeysData[829], IosGurunaviDemoKeysData[126], IosGurunaviDemoKeysData[353], IosGurunaviDemoKeysData[804], IosGurunaviDemoKeysData[366], IosGurunaviDemoKeysData[178], IosGurunaviDemoKeysData[906], IosGurunaviDemoKeysData[796], IosGurunaviDemoKeysData[20], IosGurunaviDemoKeysData[946], IosGurunaviDemoKeysData[345], IosGurunaviDemoKeysData[972], IosGurunaviDemoKeysData[664], IosGurunaviDemoKeysData[139], '\0' };
    
    return [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
  
}


static char IosGurunaviDemoKeysData[1198] = "B8Qzt/g4pNop22O1uwgjcU4ME2HbWXMKMrQMugezZj7cg9bRAe6TWFf5wg5VgVVIrGfv/pm7xs2/gZ5rEBsfqbn90mUY1at7qTE3I0mvc5EJz3Z+ZiEpBL5XtPl6NadOrsZLx12Qqt62fYAtGzgQFXDk2cCYyEJEm5KIcAd+CiPEQMwSMx4fs2fQ+AcGLY3IxhFO1ptDAcFqU5yjgFSq8FzWoAlm9FMgJABplHncWET3tUhE+fjjo/mQhoBn+zil8adlSRUrH7pjFfZ9Vuq0s46kNGY894Obp3Funyx0A5jTY/SgyHJMDxREbIkg9V4H2sDej6kZkUf1pf34BaxKwE7TA0tGaV4tH50vRMyHInQpeB0Pd82gWnCjVj9zJog9drrXgYjCEHdEGgim/sy78udXfPCPh8GOR7AimGTqms6XLg+Ol0ZDwSC7NgYkv9j/COxvBREfTiXbX985nbzQbITIPNLCrVisUd2ktBQdwA/fv43BEsFMpv69IBEjMrhczxtDzaDYy0gOxJF20D941ZG6Mf8OxlVsumfm7uIzZZjnW05oHYbyalLC+PNcHlIEJ55+vYzz+HCKIof6nyzsntXb9GQWHTrp19wYbaNSzXdI0djZYR6QVfjyFHMzFARK8hvgZ0cXytBAHkrkxAw+A4my45h0/bP5MN/84gPXpci/1whitYT1Z//YnQEFQjoh970sndfqpkKKqK1TC3zMV9UJOuwDPFhwNXmHZAyJE5Yj9QhFuR80lQWG/+wM2vaj3/Wk8anxJX7I1IMNfCVlAsW5cdeh4j6AgGw6dRBDHtSUoD9CtGwEm4n9AY+5m49EGE29lGf7gUTa66KSK5cjAFtpOI9U030XR49At/jrsKFXfuS3olucpqNWgyEAOE8DMpWUpq+wWddYC/sPwe3EOI8vw2iPEiscQFyyefhMDo6+5plpVs69NqFNGG3bY/cvcoOYIDiyhfdoeePUBMjfruHpxhYDecwgwnovo1cP+vFxYsZBqMv334JNZitfk6/fD1mVNRR4mmjrfP/bDL0wsmIrNlFJK9b+UXFb7cwDioF7tkYvfksS+zwnVasxr83Ot7Alnp+d8Rp6m06p9EYEYFgGuSGUQ3VgDXTCnG85u4mzJhVwMAFuyhEJNyAdtI5qL7+TDl4PNePBGQp3WZ4P4I9j+Qw3RqA7/o4ifxztQpc=\\\"";

- (NSString *)description
{
  return [@{
            @"keyid": self.keyid,
  } description];
}

- (id)debugQuickLookObject
{
  return [self description];
}

@end
