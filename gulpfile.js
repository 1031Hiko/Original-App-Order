var gulp = require('gulp');
var browserify = require('browserify');
var source = require('vinyl-source-stream');
var glob = require('glob');
var del = require('del');
var notify = require('gulp-notify');

gulp.task(
  'compile',
  [
    'clean',
    'compile-es6'
  ]
);

gulp.task('compile-es6', function() {
  var files = glob.sync('./app/frontend/javascripts/**/*.{js, jsx}')
  browserify({ entries: files, debug: true })
  .transform('babelify')
  .bundle()
  .on("error", function(err) {
    return notify().write(err)
  })
  .pipe(source('bundle.js'))
  .pipe(gulp.dest('./app/assets/javascripts/components'))
});

gulp.task('clean', function() {
  del('./app/javascripts/components/*.js')
});

gulp.task('watch', function() {
  gulp.watch('./app/frontend/javascripts/**/*.js', ['compile'])
});