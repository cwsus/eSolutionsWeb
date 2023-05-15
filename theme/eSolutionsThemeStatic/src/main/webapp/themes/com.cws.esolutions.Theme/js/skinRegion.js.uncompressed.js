(function() {
    if (!i$.isIE) {

        i$.addOnLoad(function() {
            var labels = new Array();
            var sectionElements = document.getElementsByTagName("SECTION");
            var regionNodeWindowID = null;
            for (var i = 0; i < sectionElements.length; i++) {
                if (i$.hasClass(sectionElements[i], "a11yRegionTarget")) {
                    var sectionRegionNode = sectionElements[i];
                    var tempSpanNode = null;
                    var tempSpanNodes = sectionRegionNode.getElementsByTagName("SPAN");
                    var headerElements = document.getElementsByTagName("HEADER");
                    var headerNode = null;
                    for (var j = 0; j < tempSpanNodes.length; j++) {
                        if (i$.hasClass(tempSpanNodes[j], "a11yRegionLabel")) {
                            tempSpanNode = tempSpanNodes[j];
                        }
                    }
                    if (tempSpanNode) {
                        var spanRegionNode = tempSpanNode;
                        var tempParentNode = sectionRegionNode;
                        // get window id
                        while ((tempParentNode = tempParentNode.parentNode) != null) {
                            if (i$.hasClass(tempParentNode, "component-control")) {
                                var m = tempParentNode && (tempParentNode.className || "").match(/id-([\S]+)/);
                                regionNodeWindowID = m && m[1];
                                break;
                            }
                        }
                        if (regionNodeWindowID) {
                            var ariaHeaderId = "skinHeader" + regionNodeWindowID;

                            var label = spanRegionNode.innerHTML;
                            // a portlet could appear multiple times on a page causing duplicate aria-labels
                            // therefore we cannot use aria-labeled by to point to the portlet title
                            // instead, check for duplicates and number the labels to make them unique
                            if (labels.indexOf(label) > -1) {
                                // find the next number
                                for (var j = 0; j < labels.length; j++) {
                                    var newLabel = label.concat(" ").concat(j + 1);
                                    if (labels.indexOf(newLabel) == -1) {
                                        // this one does not exist so use it
                                        label = newLabel;
                                        labels.push(label);
                                        break;
                                    }
                                }
                            } else {
                                labels.push(label);
                            }
                            sectionRegionNode.setAttribute("aria-label", label);
                            for (var k = 0; k < headerElements.length; k++) {
                                if (i$.hasClass(headerElements[k], "wpthemeControlHeader")) {
                                    headerNode = headerElements[k];
                                    if (headerNode.parentNode == sectionRegionNode)
                                        headerNode.setAttribute("aria-label", ariaHeaderId);
                                }
                            }
                        }
                    }
                }
            }
        });
    }
})();