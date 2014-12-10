angular.module('stories.directives', []).directive "storyTypeInput", ->
  require: "ngModel"
  link: (scope, elm, attrs, ctrl) ->
    ctrl.$parsers.unshift (viewValue) ->
      "Story::#{ viewValue }"

    ctrl.$formatters.unshift (modelValue) ->
      modelValue.split('::')[1]