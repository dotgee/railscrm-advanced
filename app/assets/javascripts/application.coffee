# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require jquery
#= require jquery_ujs
#= require angular
#= require angular-resource
#= require twitter/bootstrap
#= require select2
#= require admin
#= require flat-ui
#= require angular-bootstrap/ui-bootstrap
#= require angular-bootstrap/ui-bootstrap-tpls
#= require_self
#= require_tree .

window.Crm = angular.module("crm", ['ngResource', 'ui.bootstrap'])

Crm.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content
  $httpProvider.defaults.headers.common['Accept'] = "application/json"
]

