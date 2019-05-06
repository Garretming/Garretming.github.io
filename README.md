# 将Gitbook上的书籍发布在GitHubPages上

GitBook 是一个基于 Node.js 的命令行工具，可使用 Markdown 来制作精美的电子书.

但是Gitbook由于网络问题,许多其他人发布的项目不能直接查看,或者保存.但是我们可以通过Github将fork Gitbook 源码到自己的Github,并设置Github Pages 页面访问, 来实现保存Gitbook项目的目的.

GitHub Pages 简单说就是一个可以托管静态网站的 Git 项目，支持使用 markdown 语法以及 Jekyll 来构建，或者直接使用已经生成好的静态站点。我们就可以使用GitPages搭建自己的个人博客

由于 gitbook 书籍可以通过`gitbook`本地构建出 site 格式，所以可以直接将构建好的书籍直接放到 GitHub Pages 中托管，之后，可以通过如下地址访问书籍：

&lt;username&gt;`.github.io/<project>`

例如：这本书中使用的例子 ‘test’ 项目可以通过地址：_chengweiv5.github.io/test_来访问。

当访问Garretming_.github.io/gitbook_时，会访问Garretming/_gitbook项目的\_gh-pages_分支的内容，所以需要为项目创建一个_gh-pages_分支，并且将静态站点内容放入其中。也就是说，_gitbook_ 项目将有如下两个分支：

* master, 保存书籍的源码
* gh-pages, 保存书籍编译后的 HTML 文件

## 安装GitBook {#安装gitbook}

安装Gitbook

安装node.js

编译安装或者对应的二进制安装

yum install nodejs

1

安装Gitbook

国内环境建议修改npm源为淘宝镜像站后再安装

npm install gitbook-cli -g

gitbook -V


配置gitbook

可以在github上创建一个项目，然后clone到本地，进入项目根目录，执行gitbook init，编辑gitbook.json，SUMMARY.md，README.md，以及.gitignore

book.json

book.json是gitbook的配置文件，包括插件的配置文件，通过插件可以丰富电子书的功能，有兴趣的可以去官方找找，很多很有意思的插件（插件越多js文件越多，我的vps流量计费，所以我的是乞丐版 T T）

贴一下我的book.json

cat book.json

{

```
"title": "huangwjwork's notes",

"description": "好记性不如烂笔头，记录日常遇到的问题及学习的成果",

"author": "huangwjwork",

"output.name": "site",

"language": "zh-hans",

"gitbook": "3.2.3",

"root": ".",

"links": {

    "sidebar": {

        "Home": "https://huangwj.app"

    }

},

"plugins": \[

    "github@^2.0.0",

    "edit-link@^2.0.2",

    "anchors@^0.7.1",

    "include-codeblock@^3.0.2",

    "splitter@^0.0.8",

    "tbfed-pagefooter@^0.0.1",

    "expandable-chapters-small@^0.1.7",

    "anchor-navigation-ex@0.1.8"

\],



"pluginsConfig": {

    "theme-default": {

        "showLevel": true

    },

    "github": {

        "url": "https://github.com/huangwjwork/gitbook"

    },

    "include-codeblock": {

        "template": "ace",

        "unindent": true,

        "edit": true

    },

    "tbfed-pagefooter": {

        "copyright": "Copyright © huangwjwork 2017",

        "modify\_label": "该文件修订时间：",

        "modify\_format": "YYYY-MM-DD HH:mm:ss"

    },

    "edit-link": {

        "base": "https://github.com/huangwjwork/gitbook/edit/master",

        "label": "Edit This Page"

    },

    "anchor-navigation-ex": {

        "isRewritePageTitle": false,

        "tocLevel1Icon": "fa fa-hand-o-right",

        "tocLevel2Icon": "fa fa-hand-o-right",

        "tocLevel3Icon": "fa fa-hand-o-right"

    }





}
```

}

编写完成后在book.json文件目录执行如下命令安装插件

gitbook install

SUMMARY.md

概要文件主要存放 GitBook 的文件目录信息，左侧的目录就是根据这个文件来生成的，它通过 Markdown 中的列表语法来表示文件的层级关系，下面是一个简单的示例：

\# Summary

\* \[Introduction\]\(README.md\)

---

\* \[个人简历\]\(ABOUT\_ME.md\)

---

\* \[关于博客\]\(ABOUT\_BLOG.md\)

---

\* \[知识库\]\(knowledge.md\)

```
\* \[操作系统\]\(OS/os.md\)

    \* \[Linux\]\(OS/linux/linux.md\)

    \* \[windows\]\(OS/win/windows.md\)

    \* \[Unix\]\(OS/unix/unix.md\)
```



编写完成后，可以执行init命令让gitbook自动生成上述目录结构

$ gitbook init

info: create SUMMARY.md

info: initialization is finished



README.md

电子书的主页，可以在book.json中修改

.gitignore

由于生成电子书时会产生大量的nodejs文件以及\_gitbook的电子书文件，建议配置.gitignore

\[huangwj@instance-1 ~\]$ cat /opt/huangwj/gitbook/.gitignore

/\_book/

/node\_modules/



生成gitbook电子书

主要配置文件编辑完成后，就可以生成gitbook电子书，默认生成html，可以在本地起服务查看，也可以将html拷贝到web服务器下查看

本地查看，默认端口4000，可以更改

$ gitbook serve

Live reload server started on port: 35729

Press CTRL+C to quit ...

info: 41 plugins are installed

info: 15 explicitly listed

info: loading plugin "github"... OK

info: loading plugin "edit-link"... OK

info: loading plugin "anchors"... OK

info: loading plugin "include-codeblock"... OK

info: loading plugin "splitter"... OK

info: loading plugin "tbfed-pagefooter"... OK

info: loading plugin "expandable-chapters-small"... OK

info: loading plugin "anchor-navigation-ex"... OK

info: loading plugin "livereload"... OK

info: loading plugin "highlight"... OK

info: loading plugin "search"... OK

info: loading plugin "lunr"... OK

info: loading plugin "sharing"... OK

info: loading plugin "fontsettings"... OK

info: loading plugin "theme-default"... OK

info: found 26 pages

info: found 27 asset files

warn: "options" property is deprecated, use config.get\(key\) instead

info: &gt;&gt; generation finished with success in 5.0s !

Starting server ...

Serving book on [http://localhost:4000](http://localhost:4000)



部署webhook并与github联动

安装webhookit

安装webhookit，并生成默认配置文件，请注意自己的Python环境，调用相应的pip

pip install webhookit

webhookit\_config &gt; /opt/webhook/webhook\_for\_github.conf



修改配置文件

​ 如果执行脚本在webhook本机，只需要修改如下两个参数

repo\_name/branch\_name修改成自己的项目名称和分支名

SCRIPT写入自己要执行的脚本

\[huangwj@instance-1 ~\]$ cat /opt/webhook/webhook\_for\_github.conf

\# -\*- coding: utf-8 -\*-

'''

Created on May-25-18 19:10:16

@author: hustcc/webhookit

'''

\# This means:

\# When get a webhook request from \`repo\_name\` on branch \`branch\_name\`,

\# will exec SCRIPT on servers config in the array.

WEBHOOKIT\_CONFIGURE = {

```
\# a web hook request can trigger multiple servers.

'gitbook/master': \[{

    \# if exec shell on local server, keep empty.

    'HOST': '',  \# will exec shell on which server.

    'PORT': '',  \# ssh port, default is 22.

    'USER': '',  \# linux user name

    'PWD': '',  \# user password or private key.



    \# The webhook shell script path.

    'SCRIPT': '/opt/huangwj/scripts/gitbook\_update.sh &gt; /opt/huangwj/scripts/gitbook\_update.log'

}\]
```

}


我的脚本

\[huangwj@instance-1 scripts\]$ cat gitbook\_update.sh

\#!/bin/bash

source /etc/profile

source /home/huangwj/.bash\_profile

date

cd /opt/huangwj/gitbook

git pull

gitbook install

gitbook build



启动webhookit

webhookit -c /opt/webhook/webhook\_for\_github.conf -p port

1

启动完成后即可访问localhost:port查看webhook的信息及推送的URL，在github填入URL并配置type为json即可。

配置github

项目——setting——webhook——ADD webhook

payload URL：填写webhookURL

Content type ：application/json

触发条件可选，我这里选择的是Just the push event.

---

## 编译书籍 {#编译书籍}

首先，创建一个文件夹,用户来存放要编译的书籍.

```
mkdir book 
&
&
cd
 book
```

将需要编译的数据源码仓库从Github上clone到当前文件夹中.

```
git clone git@github.com:Garretming/gitbook.git
```

使用`gitbook build`将书籍内容输出到默认目录，也就是当前目录下的_\_book_目录。

```
gitbook build
```

build 失败的可能是配置出现了错误,可以根据提示修改book.json 的配置信息.  
注意:记得修改book.json后提交到github上.

```
git add book.json
git commit -m 
"update book.json"

git push -u origin master
```

## 创建 gh-pages 分支 {#创建-gh-pages-分支}

执行如下命令来创建分支，并且删除不需要的文件：

```
git checkout --orphan gh-pages
git rm 
-f
 --cached -r .
git clean -df
rm -rf *~
```

现在，目录下应该只剩下_\_book_目录了，首先，忽略一些文件：

```
echo
"*~"
>
 .gitignore

echo
"_book"
>
>
 .gitignore
git add .gitignore
git commit -m 
"Ignore some files"
```

然后，加入_\_book_下的内容到分支中：

```
cp -r _book/* .
git add .
git commit -m 
"Publish book"
```

## 上传书籍内容到 GitHub {#上传书籍内容到-github}

现在，可以将编译好的书籍内容上传到 GitHub 中_book_项目的_gh-pages_分支了，虽然这里还没有创建分支，上传和创建会一步完成！

```
git push -u origin gh-pages
```

现在，书籍的内容已经上传到 GitHub 上，所以通过访问_meik-zhanggithub.io/test_就可以阅读_test_这本书了！

参考此书籍,总结完善后发表本文,并将[此本书发布在Github Pages上](https://meiko-zhang.github.io/gitbook/).

