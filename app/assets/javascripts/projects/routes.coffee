angular.module('projects.routes', []).config(['$routeProvider', ($routeProvider)->
  $routeProvider
    .when('/projects', {
      templateUrl: '/templates/projects/index.html'
      controller: 'ProjectsCtrl'
    })
    .when('/projects/:id', {
      templateUrl: '/templates/projects/show.html'
      controller: 'ProjectCtrl'
    })
])
