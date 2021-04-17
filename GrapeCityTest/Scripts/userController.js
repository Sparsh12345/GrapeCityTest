var userController = angular.module("blogApp", [])

userController.controller('userController', ['$scope', '$http', function ($scope, $http) {
    $scope.userModel = {};
    $scope.ValidateUser = function () {
        $http({
            method: "post",
            url: "/Home/ValidateUser",
            data: { userModel: $scope.userModel }
        }).then(function (response) {
            if (response.data != "Something Went wrong.") {
                if (response.data) {
                    window.location.href = "/Blogs/Index";
                }
                else {
                    alert("Invalid Username or Password!")
                }
            } else { alert("Something Went wrong."); }
            return response.data;
        }, function (response) {

        });
    };


}]);