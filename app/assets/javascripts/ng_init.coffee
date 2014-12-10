sTracker = angular.module 'scrumTracker', [
  'ngResource'
  'ngRoute'
  # 'mgcrea.ngStrap.select'
  'txtareaAutogrow'
  'projects.resources'
  'projects.controllers'
  'projects.routes'
  'stories.resources'
  'stories.controllers'
  'stories.directives'
]


sTracker.config(['$routeProvider', '$sceProvider', ($routeProvider, $sceProvider)->
  $routeProvider.otherwise({redirectTo: '/projects'})
  $sceProvider.enabled false
])