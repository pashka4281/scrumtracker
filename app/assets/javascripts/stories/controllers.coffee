angular.module('stories.controllers', [])

# Story controller:
.controller('StoryCtrl', ['$scope', 'Stories', ($scope, Stories)->
  POINTS_MAX = 3
  POINTS_MIN = 0
  $scope.storyTypes = ['Task', 'Bug', 'Chore']
  $scope.isExpanded = false

  $scope.closeAndSave = (onSave)->
    $scope.story.$update({ project_id: $scope.project_id }, onSave)

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

  $scope.toggleStory = ->
    if $scope.isExpanded
      $scope.closeAndSave ->
        $scope.isExpanded = !$scope.isExpanded
    else
      $scope.isExpanded = !$scope.isExpanded
])
