#log binding activities
Ember.LOG_BINDINGS = true
window.TM = Ember.Application.create
  rootElement:'#tm-app'
  LOG_TRANSITIONS:true
  LOG_TRANSITIONS_INTERNAL: true
  #log when Ember generates a controller or a route from a generic class
#  LOG_ACTIVE_GENERATION: true
  #log when Ember looks up a template or a view
#  LOG_VIEW_LOOKUPS: true