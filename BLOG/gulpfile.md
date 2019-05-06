VS中使用Gulp
关于gulp资料可以访问:http://www.gulpjs.com.cn/，本篇主要讲解在VS中使用gulp对js和css进行压缩合并

1、下载node.js，gulp依赖于node.js，可以访问http://nodejs.cn/下载，本人下载的4.4.4版本，下载完后进行傻瓜式安装，注意安装路径最好不要含有空格或中文

2、安装gulp以及需要的插件

    1、输入命令进行安装gulp

        npm install --global gulp

    2、安装需要用到的插件，可以选择安装

        npm install gulp-minify-css gulp-uglify gulp-concat gulp-rename gulp-notify

    3、输入gulp -v，如果能出现版本号说明安装成功

3、新建Web项目，并在项目根目录下新建gulpfile.js，内容为：
var gulp = require('gulp'),//载入gulp模块

    less = require('gulp-less')；//载入需要用到的插件
//定义一个testLess任务（自定义任务名称）

gulp.task('testLess', function () {

    gulp.src('less/*.less')       //该任务针对的文件

        .pipe(less())             //该任务调用的模块

        .pipe(gulp.dest('css'));  //将会在css下生成index.css

});

//监听less文件

gulp.task('gulpWatch',function(){
gulp.watch('less/*.less',['testLess']);
});
//同时让默认程序执行一次，可以提高开始执行速度。


最后在你的当前项目命令行中输入gulp执行即可。你会看到在相关的路径下生成对应的css文件。

但是,一般我们在公司,都不需要自己去配置这样一个文件,因为每次开发项目的时候都可以使用公司已经配置好的gulpfile.js文件,
把下面的代码拷贝到自己创建的gulpfile.js文件中即可使用:
