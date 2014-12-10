angular.module('stories.resources', []).factory('Stories', ['$resource', ($resource)->
  $resource('/api/stories/:id', { id: '@id' }, {
    'update': { method: 'put' }
  })
])
