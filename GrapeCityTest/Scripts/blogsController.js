var blogsController = angular.module("blogApp", [])

blogsController.controller('blogsController', ['$scope', '$http', function ($scope, $http) {

    $scope.AddBlogModel = {};

    $scope.GetBlogList = function () {
        $http({
            method: "get",
            url: "/Blogs/GetBlogList",
            data: { userModel: $scope.userModel }
        }).then(function (response) {
            $scope.BlogsData = response.data;
            return response.data;
        }, function (response) {

        });
    };

    $scope.GetBlogByBlogId = function (id) {
        $http({
            method: "post",
            url: "/Blogs/GetBlogById",
            data: { id: id }
        }).then(function (response) {
            $scope.AddBlogModel = response.data;
            $("#btnAddNew").click();
            return response.data;
        }, function (response) {

        });
    };

    $scope.SaveBlog = function () {
        $http({
            method: "post",
            url: "/Blogs/SaveBlog",
            data: { blogsModel: $scope.AddBlogModel }
        }).then(function (response) {
            if (response.data == true) {
                alert("Blog Saved/Update Successfully!");
                $scope.AddBlogModel = {};
                $scope.GetBlogList();
            } else {
                alert("Something went wrong!");
            }
            return response.data;
        }, function (response) {

        });
    };

    $scope.DeleteBlog = function (id) {
        if (confirm("Are you sure to delete?")) {
            $http({
                method: "post",
                url: "/Blogs/DeleteBlog",
                data: { id: id }
            }).then(function (response) {
                $scope.GetBlogList();
                return response.data;
            }, function (response) {

            });
        }
    };

    $scope.GetBlogList();
}]);