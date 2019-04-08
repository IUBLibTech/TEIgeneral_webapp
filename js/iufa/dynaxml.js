/**
 * This file handles client interactions on the dynaxml page
 */

/**
 * toggle long/short list view
 */
function toggleList(listname) {
        var list = Ext.get(listname);
        var lis = list.select('li');
        var button = list.select('a').item(0);

        var style = 'block';
        for (var i = 11; i < lis.getCount(); i++) {
            if (lis.item(i).getStyle("display") == 'none') {
               style = 'none';
               break;
            }
        }
        if (style == 'none') {
                button.dom.innerHTML = "Show fewer";

                for (var i = 11; i < lis.getCount(); i++) {
                        lis.item(i).setStyle("display", "block");
                }
        } else {
                button.dom.innerHTML = "View all (" + (lis.getCount()-1) + ")";
                for (var i = 11; i < lis.getCount(); i++) {
                    if (lis.item(i).select('a').getCount() == 0) {
                        lis.item(i).setStyle("display", "none");
                    }
                }
        }
}



