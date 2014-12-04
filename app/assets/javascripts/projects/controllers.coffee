angular.module('projects.controllers', []).controller('ProjectsCtrl', ['$scope', ($scope)->
  
  $scope.projects = [
    { name: "First project" }
    { name: "Second project" }
    { name: "Third project" }
  ]
])
