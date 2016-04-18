module.exports = function(grunt) {
  grunt.initConfig({
    watch: {
      styles: {
        files: ['src/less/**/*.less'],
        tasks: ['less']
      }
    },
    less: {
      dev: {
        options : {
          compress: true
        },
        files: {
          'build/css/style.css': ['src/less/**/*.less']
        }
      }
    },
    clean: {
      build: ['build/']
    },
    browserSync: {
      dev: {
        bsFiles: {
            src : ['build/css/*.css', '*.html']
        },
        options: {
            server: {
                baseDir: "./"
            },
            watchTask: true
        }
      },
      prod: {
        options: {
            port: 8000,
            server: {
                baseDir: "./"
            }
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-browser-sync');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-clean');

  grunt.registerTask('default', ['clean', 'less']);
  grunt.registerTask('runwatch', ['browserSync:dev', 'watch'])
  grunt.registerTask('runserver', ['browserSync:prod'])
};