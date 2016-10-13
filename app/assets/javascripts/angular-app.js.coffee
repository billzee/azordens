# app/assets/javascripts/angular-app.js.coffee
# with turbolinks
$(document).on 'turbolinks:load', ->
  angular.bootstrap document.body, ['azordens']
