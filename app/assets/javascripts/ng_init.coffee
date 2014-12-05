sTracker = angular.module 'scrumTracker', [
  'ngResource'
  'ngRoute'
  'projects.resources'
  'projects.controllers'
  'projects.routes'
  'stories.resources'
  'stories.controllers'
]


sTracker.config(['$routeProvider', ($routeProvider)->
  $routeProvider.otherwise({redirectTo: '/projects'})
])
