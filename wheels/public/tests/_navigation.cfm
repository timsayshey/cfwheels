<cfscript>

type = request.wheels.params.type;

subnavigation = [
	{
		route="wheelsPackages", type="app", text="<i class='tasks icon'></i> App"
	},
	{
		route="wheelsPackages", type="core", text="<i class='tasks icon'></i> Core"
	}
];
pluginList = "";
if(application.wheels.enablePluginsComponent){
	pluginList = structKeyList(application.wheels.plugins);
}


// Get Plugins
for(p in pluginList){
	arrayAppend(subnavigation, {
		"route"="wheelsPackages", "type"=p, "text"="<i class='plug icon'></i> #p#"
	});
}

</cfscript>
<cfoutput>
<div class="ui pointing stackable menu">


	<cfloop from="1" to="#arrayLen(subnavigation)#" index="i">
		<cfscript>
		navArgs = {
			"route"=subnavigation[i]['route'],
			"text"=subnavigation[i]['text']
		};
		if(structKeyExists(subnavigation[i], "type"))
			navArgs['type'] = subnavigation[i]['type'];
		</cfscript>
		<a href="#urlFor(argumentCollection = navArgs)#" class="item">#navArgs['text']#</a>
	</cfloop>

<!--- Plugins --->
</div>

<div class="ui segment">
	<a href="#urlFor(route="wheelsTests", type=type)#" class="ui button blue">Run All #UCASE(type)# Tests <i class='right arrow icon'></i></a>
	<a href="#urlFor(route="wheelsTests", params="reload=true",  type=type)#" class="ui button teal">Run All #UCASE(type)# Tests with Reload <i class='right refresh icon'></i> </a>
</div>
</cfoutput>
