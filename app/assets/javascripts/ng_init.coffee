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


sTracker.config ['$routeProvider', '$sceProvider', '$httpProvider', ($routeProvider, $sceProvider, $httpProvider)->
  $routeProvider.otherwise({redirectTo: '/projects'})
  $sceProvider.enabled false

  #  using csrf tokens for angular requests:
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  $httpProvider.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest"
]