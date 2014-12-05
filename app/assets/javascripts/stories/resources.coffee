angular.module('stories.resources', []).factory('Stories', ['$resource', ($resource)->
  $resource('/api/stories/:id', null, {
    'update': { method: 'put' }
  })
])
