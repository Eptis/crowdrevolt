function QuestionsCtrl($scope, $http) {
  // console.log(window.location.href)
  $http.get(window.location.href+'/questions.json').success(function(data) {
    $scope.questions = data.questions;
    console.log(data.questions);
  });
}