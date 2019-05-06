# [GitBook关联GitHub](https://segmentfault.com/a/1190000011440899)

* [github](https://segmentfault.com/t/github/blogs)
* [gitbook](https://segmentfault.com/t/gitbook/blogs)

想用GitBook的客户端写文档，但是发现不能登录GitBook的帐号，主要目的是想把工作成果保存到网络上避免放在自己电脑上丢失。于是我采用折衷的办法，用GitBook在本机写作，然后把文章保存在GitHub。

## 1. 下载安装GitBook Editor {#articleHeader0}

链接：[https://www.gitbook.com/editor/](https://www.gitbook.com/editor/)

安装后打开，客户端提示登录GitBook帐号。由于我值需要用GitBook Editor做编辑工具，不需要把文章存在GitBook上（根本原因是登录不了，原因你懂）。`选Do that later`：  
![](https://segmentfault.com/img/bVWaqc?w=486&h=643 "图片描述")

由于没有登录，创建的图书都会在存储在本地，而不会传到GitBook网上。GitBook Editor创建的图书默认是在`C:\Users\用户名\GitBook`目录下，我习惯把资料存在D盘，于是选择菜单栏`GitBook Editor - Change Library Path`，把目录改成`D:\GitBook`：  
![](https://segmentfault.com/img/bVWaqp?w=486&h=643 "图片描述")

## 2. 在本地创建图书 {#articleHeader1}

点击`New Book`创建图书，填写书名，点击确定，创建后图书相关的文件会存储在`D:\GitBook\Import`目录下。相关截图：  
![](https://segmentfault.com/img/bVWaqM?w=486&h=643 "图片描述")  
![](https://segmentfault.com/img/bVWaqN?w=1206&h=667 "图片描述")  
![](https://segmentfault.com/img/bVWaqO?w=690&h=198 "图片描述")

**注意：**由于我在创建图书前将`Library Path`改成了`D:\GitBook`，所以我新建的图书的文件才会存储在`D:\GitBook\Import`目录下。而`Import`目录是对应GitBook Editor菜单栏的`Import`命令。经我测试，如果再创建一个`D:\GitBook\Open`目录，对应的就是GitBook Editor菜单栏的`Open`命令。**Import和Open的区别是：**

* `Import`
  可以将从本地其它目录的图书（用
  `gitbook init`
  命令创建的图书目录）导入到
  `Library Path`
  ，导入后修改的文件内容会保存在
  `Library Path`
  。比如：在
  `D:\test\hello`
  目录通过
  `gitbook init`
  创建了一本书，然后打开GitBook Editor
  `Import`
  ，选择
  `D:\test\hello`
  ，然后
  `D:\test\hello`
  目录的文件就会复制到
  `D:\GitBook\Import\hello`
  。而在GitBook Editor中修改了内容后，这些内容会保存在
  `D:\GitBook\Import\hello`
  目录下。
* `Open`
  就是直接打开一个
  `gitbook init`
  的图书。经测试，只有在
  `Library Path`
  下的
  `Open`
  目录下使用
  `gitbook init`
  命令创建的图书，才会正常在GitBook Editor中显示。

## 3. 关联GitHub {#articleHeader2}

在GitBook打开新创建的图书，点击`Add an article`随便输入点东西。  
![](https://segmentfault.com/img/bVWarZ?w=1206&h=667 "图片描述")

注意右上角有两个按钮：`Save`和`Publish`。当点击`Save`的时候，GitBook Editor会把编辑的内容保存在`Library Path`。而当点击`Publish`的时候，就会把编辑的内容保存到Git仓库（可以是任意的Git仓库：GitHub、码云、oschina...）。如果当前这本存储在本地的图书没有关联Git仓库，GitBook Editor会弹出提示：

![](https://segmentfault.com/img/bVWasl?w=1206&h=667 "图片描述")

那么这时候就需要创建一个Git仓库了。到GitHub创建一个空白的仓库，并复制`https`的git仓库地址。**注意必须使用https的因为GitBook Editor暂时不支持SSH**，相关截图：

![](https://segmentfault.com/img/bVWasv?w=402&h=206 "图片描述")  
![](https://segmentfault.com/img/bVWasz?w=733&h=602 "图片描述")  
![](https://segmentfault.com/img/bVWasB?w=978&h=194 "图片描述")

然后把git仓库地址复制到GitBook Editor，点击`Sync`，再输入GitHub的帐号密码就OK了，相关截图：  
![](https://segmentfault.com/img/bVWasG?w=1206&h=667 "图片描述")  
![](https://segmentfault.com/img/bVWasH?w=1206&h=667 "图片描述")

最后检查一下GitHub上时候已经有刚同步上去的文件，如果有就OK了。  
![](https://segmentfault.com/img/bVWasL?w=1023&h=493 "图片描述")

接下来就可以开始编辑自己的图书，编辑后记得要点击右上角`Publish`同步到GitHub。

