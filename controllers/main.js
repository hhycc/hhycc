/**
 * Created by hehe on 2015/3/23.
 */
exports.main = function (req, res, next) {
   // console.log('Server running at http://127.0.0.1:8888/');
    res.send('site/sys/main', {
        title: 'home'
        ,layout:'layout' //模版引用，模版默认是继承Layout。如果其他模版需要修改此处

    });
};