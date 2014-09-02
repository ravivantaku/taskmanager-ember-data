TM.UserCollaborateProjectsController = Ember.ArrayController.extend
	needs: ['application']
	loginUser: Ember.computed.alias 'controllers.application.loginUser'