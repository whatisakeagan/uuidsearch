//Creates a function that converts the highlighted selection into a string and bakes it into a search URL
function onClickHandler(info, tab) {
	//Converts the selectionText into a string so it can be searched
	x = JSON.stringify(info)
	x = info.selectionText;
	
	//Creates the search URL to include the selected (string) text
    newURL = "REDACTED FOR PRIVACY" + x + "&type=Issues";
	
	//Creates a new tab with the URL we created just above
	chrome.tabs.create({ url: newURL });
	
};

//Adds a listener for the click event that invokes the above function
chrome.contextMenus.onClicked.addListener(onClickHandler);

//Adds a listener that allows us to use the contextMenu to execute the search
chrome.runtime.onInstalled.addListener(function() {
  var contexts = ["selection"];
  for (var i = 0; i < contexts.length; i++) {
    var context = contexts[i];
	var title = "Search UUIDs";
	
    var id = chrome.contextMenus.create({"title": title, "contexts":[context],
                                         "id": "context" + context});
	}
});
