Ctrl = ($scope,$state,$timeout,$http)->


  $scope.state = 'record'
  $scope.recording = false
  $scope.crunch = false
  $scope.showIntro = true

  $timeout (->
    $scope.showIntro = false
  ), 3000

  $http.get("http://flagers.herokuapp.com/api/speeches")
    .then (data)->
      for obj in data.data
        obj.label = "#{obj.title} - #{obj.created_at.formatDate()}"
        obj.summarized_text = obj.text if !obj.summarized_text
      $scope.list = data.data.splice(0,7)

  $scope.toggle =(state)->
    $scope.state = ""
    $timeout (->
      $scope.state = state
      if $scope.state == 'record'
        $scope.recording = false
        $scope.crunch = false
    ), 300

  $scope.show =(obj)->
    $scope.current = obj
    $scope.state = ""
    $timeout (->
      $scope.state = "scrum"
    ), 300

  $scope.record = ->
    if $scope.recording
      $scope.crunch = true
      $timeout (->
        $scope.state = "list"
      ), 3000

    $scope.recording = !$scope.recording

  $scope.stop = ->
    $scope.crunch = true

  $scope.label = ->
    if $scope.crunch
      "Crunching Diz Scrum"
    else if $scope.recording
      "Click the Button to Stop Recording and Let it Flag"
    else
      "Click the Button to Start Recording"

Ctrl.$inject = ['$scope','$state','$timeout','$http']
angular.module('client').controller('DashboardCtrl', Ctrl)
