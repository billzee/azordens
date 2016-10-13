'use strict';

angular.module('azordens')
.service('ngTableService', function(ngTableParams, $filter) {
  this.options = {
    page: 1,
    count: 3,
    filterDelay: 0
  };

  this.newTable = function(options) {
    angular.extend(this.options, options || {});
    var ngTable = new ngTableParams({
      page: options.page,
      count: options.count,
      sorting: options.sorting,
      filter: options.filter
    }, {
      getData: function($defer, params) {
        ngTable.loadingTable = true;

        options.promise({params: params.url()})
        .success(function(data) {

          var filteredData = params.filter() ? $filter('filter')(data, params.filter()) : data;
          var orderedData = params.sorting() ? $filter('orderBy')(filteredData, params.orderBy()) : filteredData;
          params.total(data.total);
          $defer.resolve(filteredData, orderedData);

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
