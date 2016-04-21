module.exports = function(grunt) {
  grunt.initConfig({
    watch: {
      scripts: {
        files: ['src/coffee/**/*.coffee'],
        tasks: ['coffee']
      },
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
    coffee: {
      main: {
        files: {
          'build/js/app.js': ['src/coffee/*.coffee']
        }
      }
    },
    browserSync: {
      dev: {
        bsFiles: {
            src : ['build/css/*.css', '*.html', 'build/js/*.js']
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
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-browser-sync');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default', ['clean', 'coffee', 'less']);
  grunt.registerTask('runwatch', ['browserSync:dev', 'watch'])
  grunt.registerTask('runserver', ['browserSync:prod'])
};
