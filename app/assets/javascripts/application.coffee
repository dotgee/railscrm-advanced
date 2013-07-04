# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require jquery
#= require jquery_ujs
#= require angular-unstable/angular
#= require angular-resource
#= require twitter/bootstrap
#= require select2
#= require admin
#= require flat-ui
#= require angular-bootstrap/ui-bootstrap
#= require angular-bootstrap/ui-bootstrap-tpls
#= require angular-ui-router/release/angular-ui-router
#= require_self
#= require_tree .

window.Crm = angular.module("crm", ['ngResource', 'ui.bootstrap', 'ui.compat'])

Crm.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content
  $httpProvider.defaults.headers.common['Accept'] = "application/json"
]

# Crm.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
#   $routeProvider
#   .when '/contacts',
#     templateUrl: '/angular/templates/contact-list.html',
#     controller: 'ContactCtrl'
#   .when '/contacts/new',
#     templateUrl: '/angular/templates/contact-form.html',
#     controller: 'ContactCtrl'
# 
#   $locationProvider.html5Mode(true)
# ]

Crm.config ["$stateProvider", "$routeProvider", "$locationProvider", ($stateProvider, $routeProvider, $locationProvider) ->
  $stateProvider
    .state 'contacts',
      url: '/contacts',
      abstract: true,
      controller: "ContactCtrl" 
    .state 'contacts.list',
      url: '',
      views: 
        "contacts-list@":
          templateUrl: '/angular/templates/contacts-list.html'
        "contact-pane@":
          templateUrl: '/angular/templates/contact-pane.html'
        "hint@":
          template: "Hello this is hint"
    .state 'contacts.list.detail',
      url: '/{contactId:[a-z0-9]{24}}',
      views:
        "contact-pane@":
          templateUrl: '/angular/templates/contact-item.html'
          controller: [ '$scope', '$stateParams', ($scope, $stateParams) ->
          ]
    .state 'contacts.new',
      url: '/new',
      controller: [ '$scope', '$stateParams', '$state', ($scope, $stateParams, $state) ->
        console.log "blu" + $stateParams.contactId
        return
      ],
      views:
        "contact-pane":
          templateUrl: '/angular/templates/contact-form.html'

  $locationProvider.html5Mode(true)
]
        
angular.module('crm').run ($rootScope, $state, $stateParams) ->
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams
