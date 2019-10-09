# TableViewHeaderStretching

### 快速集成可拉伸头部图片的UITableView

### 测试环境：Xcode 7.0，iOS 7.0 以上

![image](http://cdn.cocimg.com/bbs/attachment/Fid_19/19_332211_32a461d161ff5de.gif)

### 集成步骤：

##### 0、将HeaderStretchingTableViewController文件夹拽入自己的项目中

##### 1、新建一个UITableViewController继承自HeaderStretchingTableViewController

##### 2、设置导航栏的背景图片 
```swift
self.navigation_backgroundImageName = @"navigation_background"
```
##### 3、设置被拉伸图片view的高度 
```swift
self.stretchingImageHeight = 200
```

##### 4、设置头部拉伸图片的名称 
```swift
self.stretchingImageName = @"image_bg"
```
