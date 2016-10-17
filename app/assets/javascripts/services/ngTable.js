'use strict';

angular.module('azordens')
.service('ngTableService', function(ngTableParams, $filter) {

  this.newTable = function(options) {
    angular.extend(options || {});
    var ngTable = new ngTableParams({
      count: 10,
      sorting: options.sorting,
      filter: options.filter,
    }, {
      counts: [],
      getData: function($defer, params) {
        ngTable.loadingTable = true;

        options.promise({params: params.url()})
        .success(function(data) {
          var filteredData = params.filter() ? $filter('filter')(data, params.filter()) : data;
          console.log(params.orderBy());
          var sortedData = params.sorting() ? $filter('orderBy')(filteredData, params.orderBy()) : filteredData;

          params.total(sortedData.length);
          $defer.resolve(sortedData.slice((params.page() - 1) * params.count(), params.page() * params.count()))

          if (options.successCallback) {
            options.successCallback.apply(this, arguments);
          }
        })
        .error(function() {
          if (options.errorCallback) {
            options.errorCallback.apply(this, arguments);
          }
        })
        .finally(function() {
          ngTable.loadingTable = false;

          if (options.finallyCallback) {
            options.finallyCallback.apply(this, arguments);
          }
        });
      }
    });
    return ngTable;
  };
});
