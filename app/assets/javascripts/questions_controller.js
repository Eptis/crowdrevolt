function QuestionsCtrl($scope, $http) {
  // console.log(window.location.href)
  $http.get(window.location.href+'/questions.json').success(function(data) {
    $scope.questions = data.questions;
    console.log(data.questions);
  });


}
 QuestionsCtrl.prototype.setupXhr = function() {
      var token;
      this.$xhr.defaults.headers.post['Content-Type'] = 'application/json';
      this.$xhr.defaults.headers.put['Content-Type'] = 'application/json';
      if (token = $("meta[name='csrf-token']").attr("content")) {
        this.$xhr.defaults.headers.post['X-CSRF-Token'] = token;
        this.$xhr.defaults.headers.put['X-CSRF-Token'] = token;
        return this.$xhr.defaults.headers['delete']['X-CSRF-Token'] = token;
      }
    };