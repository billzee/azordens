# app/assets/javascripts/angular-app.js.coffee
# with turbolinks
@app = angular.module 'azordens', []

$(document).on 'turbolinks:load', ->
  angular.bootstrap document.body, ['azordens']
