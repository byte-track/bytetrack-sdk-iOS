# ByteTrack-SDK-IOS 的接入方式
## 1. 使用CocoaPods 安装 SDK （推荐）
 &nbsp;&nbsp;在您项目工程（.xcodeproj）文件同目录下打开Podfile文件，添加pod 'bytetrack'命令，如下：
 ![](https://github.com/byte-track/bytetrack-sdk-iOS/blob/dev_0.1.0/pictures/podPic.png)
 
 &nbsp;&nbsp;执行安装命令
 ```
pod install
```
&nbsp;&nbsp;然后就可以直接使用了。

&nbsp;&nbsp;若已经安装了bytetrackSDK，想要更新到最新版本，在Podfile文件的目录下使用以下命令：
 ```
pod update 
```
&nbsp;&nbsp;若在自己的pod中无法搜索该该库，则可以尝试如下方法：
- 首先移除本地缓存的索引文件,如下命令:
 ```
rm ~/Library/Caches/CocoaPods/search_index.json
```
- 然后更新本地的库到最新。如下命令：
 ```
pod repo update
```
## 2. 手动导入SDK 

&nbsp;&nbsp;1，将所需的bytetrack.framework拷贝或者拖拽到工程所在文件夹下，左侧目录选中工程名，在Build Phases-> Link Binary With Libaries中点击“+”按钮，在弹出的窗口中点击“Add Other”按钮，选择bytetrack.framework添加到工程中，如下图：

![](https://github.com/byte-track/bytetrack-sdk-iOS/blob/dev_0.1.0/pictures/FCDF2382-9AB2-4E3A-B1A2-AD652B39D424.png)

&nbsp;&nbsp;如果Build Phases-> Link Binary With Libaries里面已经自动引入了bytetrack.framework，则忽略此步。  

&nbsp;&nbsp;2，由于该SDK使用了一些图片资源，需要在您的工程中引入该资源，不然SDK不能正常使用。添加方法： 
    - 选中工程名，在右键菜单中选择Add Files to “工程名”…
    - 从bytetrack.framework文件中选择Bytetrack.bundle文件，并勾选“Copy items if needed”复选框，单击“Add”按钮，将资源文件添加到工程中，添加后的效果如下：

![](https://github.com/byte-track/bytetrack-sdk-iOS/blob/dev_0.1.0/pictures/72A0D769-3C13-488E-86BF-EA8BB19CC03E.png)

&nbsp;&nbsp;3，在TARGETS->Build Settings->Other Linker Flags （选中ALL视图）中添加-ObjC，字母O和C大写，符号“-”请勿忽略，如下图：

![](https://github.com/byte-track/bytetrack-sdk-iOS/blob/dev_0.1.0/pictures/EEBBBE2E-DC6A-4A56-8F66-94082C9F407F.png)

&nbsp;&nbsp;4，在PROJECT>Info->Localizations 中添加中文简体语言，否则在打开相册时，显示的相册名称可能是英文，如下图：

![](https://github.com/byte-track/bytetrack-sdk-iOS/blob/dev_0.1.0/pictures/L1VzZXJzL3N1bmxpYW5nL0xpYnJhcnkvQ29udGFpbmVycy81WlNMMkNKVTJULmNvbS5kaW5ndGFsay5tYWMvRGF0YS9MaWJyYXJ5L0FwcGxpY2F0aW9uIFN1cHBvcnQvRGluZ1RhbGtNYWMvMjYxMTA3NTY1X3YyL0ltYWdlRmlsZXMvMTY2MzMwODM5OTcxM182RkE5Q0Y3NS03Q0JBLTRENzEtQjI1MC0zNTYzMzM3RDU1M0IucG5n.png)



&nbsp;&nbsp;**注意：** 不管你的工程是swift项目还是Object C项目，对于自动配置或者手动配置，Object C 和 Swift导入SDK的方式一致。区别是swift项目需要创建桥接头文件，在该文件中 `#import <Bytetrack/BytesTrack.h>` 即可使用。
<br/>
<br/>

# 开始使用
## 第一步 - 配置权限
&nbsp;&nbsp;打开info.plist文件，点击加号添加**App Transport Security Settings**，类型选择Dictionary，再往该Dictionary中添加一个**Allow Arbitrary Loads** 元素，同时设为 YES。

&nbsp;&nbsp;由于该SDK使用到了相册和相机，所以需要申请权限，在info.plist文件中添加**Privacy - Photo Library Usage Description**和**Privacy - Camera Usage Description**两项并添加相应的描述，如下图：

![](https://github.com/byte-track/bytetrack-sdk-iOS/blob/dev_0.1.0/pictures/AD1FCDF6-AC3B-492E-BE74-2AB6E1915B61.png)

<br/>

## 第二步 - 申请appKey和appId
&nbsp;&nbsp;您需要获取ByteTrack的 APP_ID 和 APP_KEY，这些信息可以注册商户账号之后，登陆商户中台，从`设置->信使设置->api管理`中获取到。这两个信息，会在下述接口中使用到。

## 第三步 - 初始化bytetrack
&nbsp;&nbsp;在AppDelegate入口方法中初始化SDK，同时也可以在此处设置SDK默认语言，用户id等，也可以后续设置
。
 ```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Bytetrack initMessengerWithApiKey:<Your iOS API Key> forAppId:<Your App ID>];//初始化SDK

    return YES;
}
```
- `Your App ID:`表示您的商户在ByTeTrack系统中的应用ID；
- `Your iOS API Key:`表示您的商户在ByteTrack系统中的应用密钥；

**tips:** 此时，您就可以正常使用ByteTrack的功能。
<br/>
<br/>


# 技术支持
&nbsp;&nbsp;除此之外，我们通过[使用指南](https://www.yuque.com/books/share/ad2cd6ce-faee-4c99-b6cb-4dc44564952e/fmyt4m)，为您提供了更加详细的使用说明。

&nbsp;&nbsp;如果您遇到使用问题，或者你想咨询有经验的开发者，可以加入我们的技术交流群：
- QQ交流群：530947468

