// 热更新脚本 只是个脚本 代替人工执行以前命令 需要配置下面的2个地址

// --工程目录
const workspaceRoot = '/private/var/www/clark-xm.xyz/gitbook'
//注意/不要忘记
const _book = workspaceRoot + '/_book/'
const _publish = '/private/var/www/clark-xm.xyz/github'

const fs = require('fs');
var gulp = require('gulp');

console.log(process.argv);

const child_process = require("child_process");
let options = {
    encoding: 'utf8',
    shell: true
};

let actiontype = 1
let watch;
let version = 1;

gulp.task('init', function(done) {
    // content
    console.log('---init--')
    child_process.execSync('python3 /private/var/www/clark-xm.xyz/gitbook/github.py -u Garretming -g Garretming -n gitbook_blog -m init');
    done();
});
gulp.task('push', function(done) {
    console.log('---push--')
    // 
    child_process.execSync('python3 /private/var/www/clark-xm.xyz/gitbook/push.py push');
    done();
});

gulp.task("gitbookbuild",function (done) {
    console.log('---gitbookbuild--')
    let cmd = 'node /Users/haha/.gitbook/versions/3.2.3/bin/gitbook.js build';
    try {
        child_process.execSync('cd /private/var/www/clark-xm.xyz/gitbook');
        child_process.execSync(cmd);
        // child_process.execSync('python3 /private/var/www/clark-xm.xyz/publish/push.py push');
    } catch (ex) {
        console.log('Compile Fail:' + ex);
    }
    done();
})

gulp.task('sync', function(done) {
    // content
    console.log('---sync--')
    child_process.execSync('cp -r '+ _book +' ' + _publish);
    done();
});


// gulp.task('push', gulp.series('sync', function(done) {
//     // console.log('---build--')
//     // Do something after a, b, and c are finished.
//     child_process.execSync('python3 /private/var/www/clark-xm.xyz/publish/push.py push');
//     done();
//   }));