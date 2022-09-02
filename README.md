<center><font face="微软雅黑" size=10>bytetrack_iOS接入流程</font></center>


## SDK接入方式
 #### 1. 使用CocoaPods 安装 SDK （推荐）
 在您项目工程（.xcodeproj）文件同目录下打开Podfile文件，添加pod 'bytetrack'命令，如下：
 ![](http://gitlab.byteslink.com/vuepress/picgo/-/raw/master/pictures/2022/09/2_14_27_23_8BBA5441-1485-473C-8087-DBD6895CA584.png)
 
 执行安装命令
 ```
pod install
```
然后就可以直接使用了。

若已经安装了bytetrackSDK，想要更新到最新版本，在Podfile文件的目录下使用以下命令：
 ```
pod update 
```
若在自己的pod中无法搜索该该库，则可以尝试如下方法：
 首先移除本地缓存的索引文件,如下命令:
 ```
rm ~/Library/Caches/CocoaPods/search_index.json
```
 然后更新本地的库到最新。如下命令：
 ```
pod repo update
```
#### 2. 手动导入SDK 
 1.将所需的bytetrack.framework拷贝或者拖拽到工程所在文件夹下，左侧目录选中工程名，在Build Phases-> Link Binary With Libaries中点击“+”按钮，在弹出的窗口中点击“Add Other”按钮，选择bytetrack.framework添加到工程中，如下图：
![](http://gitlab.byteslink.com/vuepress/picgo/-/raw/master/pictures/2022/09/2_14_27_49_FCDF2382-9AB2-4E3A-B1A2-AD652B39D424.png)
*如果Build Phases-> Link Binary With Libaries里面已经自动引入了bytetrack.framework，则忽略此步*。  

2.由于该SDK使用了一些图片资源，需要在您的工程中引入该资源，不然SDK不能正常使用。添加方法： 选中工程名，在右键菜单中选择Add Files to “工程名”…，从bytetrack.framework文件中选择Bytetrack.bundle文件，并勾选“Copy items if needed”复选框，单击“Add”按钮，将资源文件添加到工程中，添加后的效果如下：

![](http://gitlab.byteslink.com/vuepress/picgo/-/raw/master/pictures/2022/09/2_14_28_15_72A0D769-3C13-488E-86BF-EA8BB19CC03E.png)

3.在TARGETS->Build Settings->Other Linker Flags （选中ALL视图）中添加-ObjC，字母O和C大写，符号“-”请勿忽略，如下图：

![](http://gitlab.byteslink.com/vuepress/picgo/-/raw/master/pictures/2022/09/2_14_28_36_EEBBBE2E-DC6A-4A56-8F66-94082C9F407F.png)


###### 注意：不管你的工程是swift项目还是Object C项目，对于自动配置或者手动配置，Object C 和 Swift导入SDK的方式一致。区别是swift项目需要创建桥接头文件，在该文件中#import <Bytetrack/BytesTrack.h>即可使用。




## SDK的使用


#### 1. 配置权限
打开info.plist文件，点击加号添加**App Transport Security Settings**，类型选择Dictionary，再往该Dictionary中添加一个**Allow Arbitrary Loads** 元素，同时设为 YES。

由于该SDK使用到了相册和相机，所以需要申请权限，在info.plist文件中添加**Privacy - Photo Library Usage Description**和**Privacy - Camera Usage Description**两项并添加相应的描述，如下图：

![](http://gitlab.byteslink.com/vuepress/picgo/-/raw/master/pictures/2022/09/2_14_28_55_AD1FCDF6-AC3B-492E-BE74-2AB6E1915B61.png)



#### 2. 申请appKey和appId

在后台管理中填写您的️信息并申请appKey和appId，bytetrackSDK需要使用。

#### 2. 初始化bytetrack

 ```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Bytetrack initMessengerWithApiKey:<Your iOS API Key> forAppId:<Your App ID>];//初始化SDK

    
    return YES;
}
```

在AppDelegate入口方法中初始化SDK，同时也可以在此处设置SDK默认语言，用户id等，也可以后续设置。
SDK提供了如下方法可以自定义配置


 ```
//注册用户业务id
+ (void)registerUserWithUserId:(NSString *)userId;

/// 设置信使语言
/// @param languageType 语言种类  1:zh-Hans  2:en  

+(void)setLanguage:(int)languageType;

//打开信使
+(void)presentMessenger;

//设置启动图标是否一直悬浮可见,默认不可见
+ (void)setLauncherVisible:(BOOL)visible;

//退出登录
+ (void)logout;

```

######  说明
如果没有设置您的业务userId，则默认访客登录，此时产生的聊天记录可能会无法与用户关联。
用户退出登录时，需要您调用**logout**方法，解除关联。





