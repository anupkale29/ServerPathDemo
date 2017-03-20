<!DOCTYPE html>
<html data-ng-app="myApp">
<head lang="en">
<meta charset="utf-8">
<title>Path Identification</title>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

    var app = angular.module('myApp', []);
    
    app.controller('MyController', function($scope, $http, $timeout) {    	
    	$scope.rows = [];
		$scope.value = 0;
			
			$scope.callFunction = function() {
				polling();
			};
			
		var polling = function() {
			var value = $http({
				method : 'GET',
				url : 'getPath'
			});

			value.success(function(data, status, headers, config) {
				$scope.rows.push({
					loadBalancerIp : data.loadBalancerIp,
					webServerIp : data.webServerIp,
					appServerIp : data.appServerIp,
					appServerPort : data.appServerPort
				});
			});

			var promise = $timeout(function() {
				$scope.value++;
				polling();
			}, 1000);
			
			$scope.cancelFunction = function() {
				$timeout.cancel(promise);
			};
			$scope.clearFunction = function() {
				$scope.rows = [];
				$scope.value = 0;
			};
		};
	});
</script>
</head>

<body data-ng-controller="MyController">
	<h3></h3>
	<div class="container">
		<table  class="table table-bordered">
			<thead>
				<tr>
					<th>LOAD BALANCER</th>
					<th>NGINX</th>
					<th>TOMCAT:PORT</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="serverNode in rows">
					<td>{{serverNode.loadBalancerIp}}</td>
					<td>{{serverNode.webServerIp}}</td>
					<td>{{serverNode.appServerIp}}:{{serverNode.appServerPort}}</td>
				</tr>
			</tbody>
		</table>
		<div class="btn-group btn-group-justified">
			<div class="btn-group">
				<button data-ng-click="callFunction();" class="btn btn-primary">Start</button>
			</div>
			<div class="btn-group">
				<button data-ng-click="cancelFunction();" class="btn btn-primary">End</button>
			</div>
			<div class="btn-group">
				<button data-ng-click="clearFunction();" class="btn btn-primary">Clear</button>
			</div>
		</div>
		<h3>Call made to the server: {{value}} Times<h3>		
	</div>
	
</body>
</html>