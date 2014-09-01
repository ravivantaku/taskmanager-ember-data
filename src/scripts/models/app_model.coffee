#TM.ApplicationStore = DS.FixtureAdapter.extend({})
TM.ApplicationStore = DS.Store.extend
	adapter: DS.RESTAdapter
TM.ApplicationAdapter = DS.RESTAdapter.reopen
	host: 'http://192.168.0.105'
	namespace: 'taskmanagement'
	headers:( ()->
		{
		'Content-Type': 'application/json',
		'Authorization': 'Bearer ' + localStorage.getItem('token')
		}
	).property().volatile()

TM.Project = DS.Model.extend
	name: DS.attr 'string'
	projectId: DS.attr 'string'
	description: DS.attr 'string'
	owner: DS.attr 'string'
#	createdAt: DS.attr 'date', {defaultValue: new Date() }
	ownerId: DS.belongsTo 'user', {async:true,inverse: 'projects'}
	tasks: DS.hasMany 'task', {async:true}
	colabrators: DS.hasMany 'user', {async:true}

TM.User = DS.Model.extend
	projectsOwn : DS.hasMany 'project', {async:true},
	collaborateProjects: DS.hasMany 'project', {async:true},
	tasks: DS.hasMany 'task', {async:true},
	email: DS.attr('string'),
	emailConfirmed: DS.attr('boolean'),
	phoneNumber: DS.attr('string'),
	phoneNumberConfirmed: DS.attr('boolean'),
	accessFailedCount: 0,
	roles: [],
	claims: [],
	logins: [],
	userName: DS.attr('string')
#TM.User = DS.Model.extend
#	userName: DS.attr 'string'
#	createdAt: DS.attr 'date'
#	isAdmin: DS.attr 'boolean'
#	location: DS.attr 'string'
#	email: DS.attr 'string'
#	phoneNumber: DS.attr 'string'
#	projects: DS.hasMany 'project', {async:true}
#	collaborateProjects: DS.hasMany 'project', {async:true}
#	tasks: DS.hasMany 'task', {async:true}

TM.Task = DS.Model.extend 
	title: DS.attr 'string'
	priority: DS.attr 'string'
	completionDate: DS.attr 'date', {defaultValue: new Date()}
	creationDate:DS.attr 'date'
	description: DS.attr 'string'
	isResolved: DS.attr 'boolean'
	estimatedTime: DS.attr 'string'
	userId: DS.belongsTo 'user', {async:true}
	status: DS.attr 'string'
	project: DS.belongsTo 'project', {async:true}

TM.ProjectSerializer = DS.RESTSerializer.extend
	extractArray: (store,type,payload)->
		projects = []
		_.each payload, (item)->
			item.id = item.projectId
			projects.push item
		projects
TM.TasksSerializer = DS.RESTSerializer.extend
	extractArray: (store,type,payload)->
		tasks = []
		_.each payload, (item)->
			item.id = item.projectId
			tasks.push item
		tasks
#TM.Project.FIXTURES = _.map _.range(20), (value)->
#		id: value + 1
#		name: faker.Name.firstName() + faker.Name.lastName()
#		createdAt: moment(faker.Date.recent(1)).format('L')
##		users: [faker.random.number(2)+1, faker.random.number(2)+1, faker.random.number(2)+1]
#		ownerId: faker.random.number(2)+1
#		tasks: [faker.random.number(20)+1, faker.random.number(20)+1, faker.random.number(20)+1, faker.random.number(20)+1]
#		key: faker.Lorem.words().join(' ')
#		description: faker.Lorem.sentence()

#TM.User.FIXTURES = [
#	{
#		createdAt: "07/17/2014"
#		email: "Stephon.Witting@keanu.tv"
#		id: 1
#		isAdmin: true
#		location: "Rowemouth rte"
#		phoneNumber: "196.922.8128"
#		projects: [1,2]
#		collaborateProjects: [3,6]
#		userName: "Ravi"
#		password: 'Design_20'
#		tasks: [2,3,4]
#	},
#	{
#		createdAt: "07/17/2014"
#		email: "Stephon.Witting@keanu.tv"
#		id: 2
#		isAdmin: true
#		location: "Rowemouth"
#		phoneNumber: "196.922.8128"
#		projects: [2]
#		collaborateProjects: [5,8]
#		userName: "Chinna"
#		password: 'Design_20'
#		tasks: [5,7,9]
#	},
#	{
#		createdAt: "07/17/2014"
#		email: "Stephon.Witting@keanu.tv"
#		id: 3
#		isAdmin: false
#		location: "Rowemouth gtrtrt"
#		phoneNumber: "196.922.8128"
#		projects: [1]
#		collaborateProjects: [1,4]
#		userName: "JK"
#		password: 'Design_20'
#		tasks: [10,3,6]
#	}
#]
#
#TM.Task.FIXTURES = _.map _.range(20), (value)->
#	id: value + 1
#	title: faker.Lorem.words().join(' ')
#	priority: faker.Company.suffixes()[faker.random.number(4)]
#	description: faker.Lorem.sentence()
#	estimatedTime: '2h'
#	completionDate: moment(faker.Date.recent(1)).format('L')
#	creationDate:  moment(faker.Date.recent(1)).format('L')
#	isResolved: false
#	status: 'open'
#	userId: faker.random.number() + 1
#	project: faker.random.number(2) + 1
