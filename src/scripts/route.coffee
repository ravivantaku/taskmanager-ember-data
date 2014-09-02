TM.Router.map ->
	@resource 'login'
	@resource 'users', ->
		@route 'new'
	@resource 'user', {path: '/users/:user_id'}, ->
		@route 'own_projects', {path: '/projects'}
		@route 'tasks'
		@route 'collaborate_projects', {path: '/collaborate'}
	@resource 'projects', {path: '/:user_id/projects'}, ->
		@route 'new'
		@resource 'project', {path: '/:project_id'}, ->
			@route 'edit'
			@route 'tasks'
			@route 'new_task', {path: '/tasks/new'}
	@resource 'tasks', {path: '/:user_id/tasks'} ,  ->
		@resource 'task', {path: '/:task_id'}, ->
			@route 'edit'
