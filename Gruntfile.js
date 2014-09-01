module.exports = function(grunt){
    (require('load-grunt-tasks'))(grunt);
    grunt.registerTask('serve',['connect:server']);
    grunt.registerTask('build',['clean','bower','concurrent:build']);
    grunt.registerTask('default',['build','concurrent:mini']);
    grunt.registerTask('all',['bower','default']);
    grunt.initConfig({
        pkg:grunt.file.readJSON('package.json'),
        clean:{
            build:{
                src:['build/']
            }
        },
        bower: {
            install:{
                options:{
                    targetDir: 'build/lib',
                    cleanTargetDir:true
                }
            }
        },
        cssmin:{
            combine:{
                files:{
                    'build/css/lib.min.css': ['build/lib/**/*.css'],
                    'build/css/all.min.css':['src/**/*.css']
                }
            }
        },
        coffee: {
            options: {
                sourceMap: true,
                join: true
            },
            combined: {
                files: {
                    'build/js/all.min.js': ['src/scripts/**/app.coffee','src/scripts/**/route.coffee','src/scripts/**/projects_model.coffee', 'src/scripts/**/!(app,route,projects_model)*.coffee']
                }
            }
        },
        concat:{
            dist:{
                src: ['build/lib/jquery/jquery.js','build/lib/bootstrap/bootstrap.js',
					'build/lib/handlebars/handlebars.js','src/scripts/ember.js', 'src/scripts/ember-data.js',
					'build/lib/lodash/lodash.compat.js','build/lib/faker/faker.js','build/lib/moment/moment.js'],
                dest: 'build/js/lib.min.js'
            }

        },
        connect: {
            server: {
                options: {
                    port: 8000,
                    keepalive: true,
                    livereload: true,
                    base: ['build/html', 'build/js', 'build/css','build/', 'src/', 'src/scripts', 'src/styles']
                }
            }
        },
        watch: {
            coffee:{
                files:['src/scripts/**/*.coffee'],
                tasks:['coffee']
            },
//            handlebars:{
//                files: ['src/templates/**/*.hbs'],
//                tasks:['handlebars']
//            },
            htmlCssJs: {
                files: ['src/**/*.html', 'src/**/*.css'],
                tasks: ['cssmin']
            },
            options: {
                spawn: true,
                livereload: true
            }
        },
        concurrent: {
            build: ['newer:cssmin', 'newer:concat','newer:coffee'], //,'newer:concat'
            mini: ['serve', 'watch'],
            options: {
                logConcurrentOutput: true
            }
        }
    });
};