'use strict';

angular.module('azordens')
  .filter('jsonDate', ['$filter', function ($filter) {
    return function(input, format) {
      return $filter('date')(new Date(input), format);
    };
  }]);
