'use strict';

angular.module('azordens')
  .directive('datepicker', function() {
    return {
      restrict: 'A',
      require : 'ngModel',
      link: function(scope, element, attrs, ngModelCtrl) {
        $(element).datepicker({
          dateFormat:'dd-mm-yyyy',
          language: 'pt-BR',
          pickTime: false,
          startDate: '01-11-2013',
          endDate: '01-11-2030'
        }).on('changeDate', function(e) {
          ngModelCtrl.$setViewValue(e.date);
          scope.$apply();
        });
      }
    };
  })
  .filter('jsonDate', ['$filter', function ($filter) {
    return function(input, format) {
      return $filter('date')(new Date(input), format);
    };
  }]);
