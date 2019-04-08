function showHideFindingAidInfo(divID) {
	var show = document.getElementById(divID);
	var hide = document.getElementById('show_' + divID);
	if (hide.style.display == 'none') { 
		hide.style.display = ''; 
		show.style.display = 'none'; 
	} else { 
		show.style.display = ''; 
		hide.style.display = 'none'; 
	}
}

function doClear(theText) {
	if (theText.value == theText.defaultValue) {
		theText.value = "";
	}
}

function checkTopForm() {
	var text = document.getElementById('freeformQuery').value;
	if (text == '' || text == 'keyword search') {
		alert('Please enter a search term');
		return false;
	} else {
		return true;
	}
}

function checkSearch() {
        var text1 = document.getElementById('text1').value;
        var text2 = document.getElementById('text2').value;
        var text3 = document.getElementById('text3').value;
        var startYear = document.getElementById('fromYear').value;
        var endYear = document.getElementById('toYear').value;

        if (text1 == '' && text2 == '' && text3 == '' && startYear == '' && endYear == '') {
                alert('Please enter a search term or select year(s).');
                return false;
        }
        else if ((text1 == '' && (text2 != '' || text3 != '')) || (text1 != '' && text2 == '' && text3 != '')) {
        		alert('To allow for accurate Boolean processing of your query, please do not skip search fields.');
        		return false;
        }
        else {
				if (startYear != '' || endYear != '') {
	                if (startYear.length !=4 || endYear.length !=4 || isNaN(startYear) || isNaN(endYear)) {
        	                alert('Please enter year(s) as 4 digit numbers.');
                	        return false;
	                }
	                else if (Number(startYear) > Number(endYear)) {
	                        alert('Please enter a year range where the ending year is greater than the starting year.');
	                        return false;
	                }
	                else {
	                        return true;
	                }
				}
		else {
			return true;
		}
	}
}


function checkEmail() {
	var text = document.getElementById('email').value;
	if (text == '') {
		alert('Please enter email address');
		return false;
	} else {
		return true;
	}
}

function zoomImageShow() {
    document.getElementById('zoomPageImage').style.display = '';
}
    	
function zoomImageHide() {
	document.getElementById('bigPageImage').style.display = 'none';
    document.getElementById('zoomPageImage').style.display = 'none';
}

function zoomPageImage() {
	document.getElementById('bigPageImage').style.display = '';
	document.getElementById('zoomOverlay').style.display = '';
}

function closePageImage(divId) {
	var hideDiv = 'showPageImage-' + divId;
	document.getElementById(hideDiv).style.display = 'none';
	document.getElementById(hideDiv).setAttribute('aria-expanded','false');
}

function showPageImage(brand, page, formatQualifier) {
	var showDiv = 'showPageImage-' + page;
	var showImg = 'overlay-' + page;
	var imgSize = formatQualifier + '/';
	document.getElementById(showDiv).style.display = '';
	document.getElementById(showDiv).setAttribute('aria-expanded','true');
	document.getElementById(showImg).src = 'http://purl.dlib.indiana.edu/iudl/' + brand + '/' + imgSize + page;
	document.getElementById(showImg).style.display = '';
	document.getElementById(showDiv).style.left = '200px';
	document.getElementById(showDiv).style.top = document.getElementById('view-'+page).offsetTop + 'px';
	Drag.init(document.getElementById(showDiv));
}

function showFigure(brand, figure, formatQualifier) {
	var showFigure = 'showFigure-' + figure;
	var showImg = 'figureOverlay-' + figure;
	var imgSize = formatQualifier + '/';
	document.getElementById(showFigure).style.display = '';
	document.getElementById(showFigure).setAttribute('aria-expanded','true');
	document.getElementById(showImg).src = 'http://purl.dlib.indiana.edu/iudl/' + brand + '/' + imgSize + figure;
	document.getElementById(showImg).style.display = '';
	document.getElementById(showFigure).style.left = '200px';
	document.getElementById(showFigure).style.top = document.getElementById('viewFigure-'+figure).offsetTop + 'px';
	Drag.init(document.getElementById(showFigure));
}

function closeFigure(divId) {
	var hideDiv = 'showFigure-' + divId;
	document.getElementById(hideDiv).style.display = 'none';
	document.getElementById(hideDiv).setAttribute('aria-expanded','false');
}



