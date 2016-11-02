'use strict';

angular.module('azordens')
  .filter('tel', function () {
    return function (input) {
      var str = input + '';
      str = str.substr(0, 1) === '+' ? str.substr(3) : str;
      str = str.replace(/\D/g, '');
      if (str.length === 11) {
        str = str.replace(/^(\d{2})(\d{5})(\d{4})/, '($1) $2-$3');
      } else {
        str = str.replace(/^(\d{2})(\d{4})(\d{4})/, '($1) $2-$3');
      }
      return str;
    };
  });
