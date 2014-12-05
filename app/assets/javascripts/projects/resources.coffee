angular.module('projects.resources', []).factory('Projects', ['$resource', ($resource)->
  $resource('/api/projects/:id', null, {
    'update': { method: 'put' }
  })
])
