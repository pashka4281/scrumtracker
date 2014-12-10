angular.module('projects.controllers', [])

# Projects controller:
.controller('ProjectsCtrl', ['$scope', 'Projects', ($scope, Projects)->
  $scope.projects = Projects.query()
])

# Project controller:
.controller('ProjectCtrl', ['$scope', 'Projects', 'Stories', '$routeParams', ($scope, Projects, Stories, $routeParams)->
  $scope.project_id = $routeParams.id
  $scope.project    = Projects.get(id: $routeParams.id)
  $scope.stories    = Stories.query(project_id: $scope.project_id)
  $scope.newStoryParams = { title: "New story", type: "Story::Task" }
  
  $scope.isShownList =
    coldbox: true
    current: true
    planned: true

  $scope.storiesForBoard = (boardName)->
    _.filter $scope.stories, (story)->
      story.board is boardName

  $scope.addStory = (boardName)->
    $.extend($scope.newStoryParams, {board: boardName}) 
    story = new Stories($scope.newStoryParams)
    story.$save { project_id: $scope.project_id }, ->
      $scope.stories.push story
])
