module.exports = function(grunt) {
  grunt.initConfig({
    watch: {
      styles: {
        files: ['src/coffee/**/*.coffee'],
        tasks: ['coffee']
      }
    },
    clean: {
      build: ['build/']
    },
    coffee: {
      main: {
        files: {
          'build/js/app.js': ['src/coffee/cookie.coffee', 'src/coffee/AlarmsCollection.coffee', 'src/coffee/AlarmModel.coffee', 'src/coffee/AlarmsView.coffee', 'src/coffee/app.coffee']
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

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-browser-sync');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default', ['clean', 'coffee']);
  grunt.registerTask('runwatch', ['browserSync:dev', 'watch'])
  grunt.registerTask('runserver', ['browserSync:prod'])
};
