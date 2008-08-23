// Requires Prototype

var VisibilityTree = new Array(); 

function add_visibility(element, visibility) {
	if (VisibilityTree[element] == null) {
		VisibilityTree[element] = visibility;
	}
}

function toggle_visibility(element) {
  div_id = $(element);
  if (VisibilityTree[element]) {
	  VisibilityTree[element] = false;
	  Effect.BlindUp(element);
  } else {
	  VisibilityTree[element] = true;
	  Effect.BlindDown(element);
  } 
} 

function refresh_visibility() {
	for (var e in VisibilityTree) {
		if ($(e)) {
			if (VisibilityTree[e]) {
				Effect.BlindDown(e);
			} else {
				Effect.BlindUp(e);
			}
		}
	}
}