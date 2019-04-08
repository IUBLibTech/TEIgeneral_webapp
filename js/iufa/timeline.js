             /* <![CDATA[ */
Timeline.GregorianDateLabeller.prototype.labelPrecise=function(date){
var x;
if ((date.getUTCDate() == 1) && (date.getUTCMonth() == 0)) {
  x = SimileAjax.DateTime.removeTimeZoneOffset( date, this._timeZone ).getUTCFullYear();
}
else {
x = SimileAjax.DateTime.removeTimeZoneOffset( date, this._timeZone ).toLocaleDateString();
}
return x;
};
 
var tl;
function onLoad() {
  var eventSourceAuthor = new Timeline.DefaultEventSource();
  var eventSourcePublication = new Timeline.DefaultEventSource();
  var eventSourceHistorical = new Timeline.DefaultEventSource();
  

 var theme = Timeline.ClassicTheme.create();
            theme.timeline_start = new Date("Jan 01 1800 00:00:00 GMT"); 
            theme.timeline_stop = new Date("Jan 01 1960 00:00:00 GMT");   
            theme.event.bubble.width = 320;
            theme.event.bubble.height = 220;
            theme.event.instant.icon = Timeline.urlPrefix+"images/dull-red-circle.png";
            theme.event.track.height = 1.5;
            theme.event.track.gap = 0.1;
            theme.ether.backgroundColors = [
                "#FF0000",
                "#FFFFFF",
                "#FFCC00",
                "#000000"
            ];
            theme.ether.interval.line.opacity = 100;
            theme.ether.highlightOpacity = 30;
            
          //       theme.ether.backgroundColors = [
     //           "#D1CECA",
     //           "#E7DFD6",
     //           "#E8E8F4",
     //           "#D0D0E8"
     //     ];


  var d = "Jan 1 1861 00:00:00 GMT"; 
  var bandInfos = [
    Timeline.createBandInfo({
   	    eventSource:    eventSourceAuthor,
        date:           d,
        width:          "25%", 
        intervalUnit:   Timeline.DateTime.MONTH, 
        intervalPixels: 40,
        theme:          theme
    }),
    Timeline.createBandInfo({
        overview:       true,
        trackHeight:    0.5,
        trackGap:       0.2,
        eventSource:    eventSourceAuthor,
        date:           d,
        width:          "10%", 
        intervalUnit:   Timeline.DateTime.YEAR, 
        intervalPixels: 40,
        theme:          theme
    }),
    Timeline.createBandInfo({
        eventSource:    eventSourcePublication,
        date:           d,
        width:          "40%", 
        intervalUnit:   Timeline.DateTime.MONTH, 
        intervalPixels: 40,
        theme:          theme
    }),
    Timeline.createBandInfo({
        eventSource:    eventSourceHistorical,
        date:           d,
        width:          "25%", 
        intervalUnit:   Timeline.DateTime.MONTH, 
        intervalPixels: 40,
        theme:          theme
    })
  ];
  
  bandInfos[1].syncWith = 0;
  bandInfos[1].highlight = true;
  bandInfos[1].eventPainter.Layout=bandInfos[0].eventPainter.Layout; 
  //bandInfos[1].eventPainter.setLayout(bandInfos[0].eventPainter.getLayout());
  bandInfos[2].syncWith = 0;
  bandInfos[3].syncWith = 0;
  

tl = Timeline.create(document.getElementById("my-timeline"), bandInfos);
  tl.loadXML("/TEIgeneral/timeline/author-events.xml", function(xml, url) {
                eventSourceAuthor.loadXML(xml, url);
                //document.getElementById("author-event-count").innerHTML = eventSourceAuthor.getCount();
            });
  tl.loadXML("/TEIgeneral/timeline/publication-events.xml", function(xml, url) {
                eventSourcePublication.loadXML(xml, url);
                //document.getElementById("publication-event-count").innerHTML = eventSourcePublication.getCount();
            });
  tl.loadXML("/TEIgeneral/timeline/historical-events.xml", function(xml, url) {
                eventSourceHistorical.loadXML(xml, url);
                //document.getElementById("historical-event-count").innerHTML = eventSourceHistorical.getCount();
            });
}

var resizeTimerID = null;
function onResize() {    
if (resizeTimerID == null) {        
resizeTimerID = window.setTimeout(function() {
            resizeTimerID = null;
            tl.layout();
        }, 500);
    }
}

function centerTimeline(date) {
tl.getBand(0).setCenterVisibleDate(Timeline.DateTime.parseGregorianDateTime(date));
}

function clientSideInclude(id, url) {
  var req = false;
  // For Safari, Firefox, and other non-MS browsers
  if (window.XMLHttpRequest) {
    try {
      req = new XMLHttpRequest();
    } catch (e) {
      req = false;
    }
  } else if (window.ActiveXObject) {
    // For Internet Explorer on Windows
    try {
      req = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
      try {
        req = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (e) {
        req = false;
      }
    }
  }
 var element = document.getElementById(id);
 if (!element) {
  alert("Bad id " + id +
   "passed to clientSideInclude." +
   "You need a div or span element " +
   "with this id in your page.");
  return;
 }
  if (req) {
    // Synchronous request, wait till we have it all
    req.open('GET', url, false);
    req.send(null);
    element.innerHTML = req.responseText;
  } else {
    element.innerHTML =
   "Sorry, your browser does not support " +
      "XMLHTTPRequest objects. This page requires " +
      "Internet Explorer 5 or better for Windows, " +
      "or Firefox for any system, or Safari. Other " +
      "compatible browsers may also exist.";
  }
}
	/* ]]> */