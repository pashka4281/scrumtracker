angular.module('projects.controllers', [])

# Projects controller:
.controller('ProjectsCtrl', ['$scope', 'Projects', ($scope, Projects)->
  $scope.projects = Projects.query()
])

# Project controller:
.controller('ProjectCtrl', ['$scope', 'Projects', 'Stories', '$routeParams', ($scope, Projects, Stories, $routeParams)->
  POINTS_MAX = 3
  POINTS_MIN = 0

  $scope.project = Projects.get(id: $routeParams.id)
  $scope.stories = Stories.query(project_id: $routeParams.id)

  $scope.isShownList =
    coldbox: true
    current: true
    planned: true

  $scope.storyTypes = ['Task', 'Bug', 'Chore']

  $scope.storiesForBoard = (boardName)->
    _.filter $scope.stories, (story)->
      story.board is boardName


  $scope.removePoints = (story) ->
    unless isNaN( parseInt(story.points) )
      story.points -= 1 if story.points > POINTS_MIN
    else
      story.points = 0

  $scope.addPoints = (story) ->
    unless isNaN( parseInt(story.points) )
      story.points += 1 if story.points < POINTS_MAX
    else
      story.points = 0
])
