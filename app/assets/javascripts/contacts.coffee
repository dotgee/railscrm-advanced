Crm.factory "Contact", ($resource) -> $resource "/api/v1/contacts/:id", id: "@id"

Crm.controller "ContactCtrl", ($scope, Contact) ->
  # Attributes accessible on the view
  $scope.selectedContact = null
  $scope.selectedRow     = null

  $scope.contact = new Contact()
  $scope.contacts = Contact.query ->
    $scope.selectedContact = $scope.contacts[0]
    $scope.selectedRow = 0

  $scope.showContact = (contact, row) ->
    $scope.selectedContact = contact
    $scope.selectedRow = row

  $scope.add = ->
    console.log "Add"
    $scope.contacts.push Contact.save first_name: $scope.contact.first_name, last_name: $scope.contact.last_name, email: $scope.contact.email, company: $scope.contact.company
    $scope.contact = new Contact()

  $scope.delete = ($index) ->
    if confirm("Are you sure you want to delete this contact?")
      $scope.contacts[$index].$delete()
      $scope.contacts.splice($index, 1)

  $scope.openModal = ->
    $scope.shouldBeOpen = true
  
  $scope.closeModal = ->
    $scope.shouldBeOpen = false
  
  $scope.modalOpts = {
    backdropFade: true,
    dialogFade: true,
    dialogClass: 'modal modal-fluid'
  }
