// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Order = Backbone.Model.extend({});
var Orders = backbone.Collection.extend({
  model: Order
});

var OrdersList = Backbone.View.extend({
  template: '#order-tmpl',

  initialize: function () {
    this.collection.on('change', this.render);
    this.collection.on('add', this.add);
    this.collection.on('remove', this.remove);
    this.collection.on('reset', this.reset);

  },

  render: function () {

  },

  add: function () {

  },

  remove: function () {

  },

  reset: function () {

  }
});

var Article = Backbone.Model.extend({});

var ArticlesList = Backbone.View.extend({
  events: {
    "button.add-order": ""
  }
});