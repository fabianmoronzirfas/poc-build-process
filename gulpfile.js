const { src, dest } = require('gulp');
function copy() {
  return src('src/*')
    .pipe(dest('dist/'));
}
function defaultTask(cb) {
  copy();
  cb();
}
exports.default = defaultTask