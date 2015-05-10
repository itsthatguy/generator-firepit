<% _.each(props.packages, function(value) { %><% if (value == "ember") { %>
  module.exports = window.App = Ember.Application.create()
<% } %><% }); %>