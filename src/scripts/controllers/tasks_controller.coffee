TM.TasksController = Ember.ArrayController.extend
	sorAscending: true
	tasksCount: ( -> @get('model.length') ).property('@each')