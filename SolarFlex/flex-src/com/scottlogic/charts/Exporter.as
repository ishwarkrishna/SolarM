package com.scottlogic.charts
{

	
	public class Exporter
	{
	  import mx.controls.Alert;

      import mx.core.UIComponent;

      import mx.core.Container;

      import mx.events.ItemClickEvent;

      import mx.utils.ObjectProxy;

      import flash.errors.*;

      import flash.events.*;

      import flash.external.*;           

      import flash.net.URLLoader;

      import flash.net.URLVariables;
	  import flash.net.FileReference;
      import flash.net.URLRequest;
	  import flash.net.URLRequestMethod;
      import mx.controls.DataGrid;
	  import mx.controls.AdvancedDataGrid;
       

        //The location of the excel export file

        private static var downloadFileRef:FileReference;
		private static const EXPORT_CSV_URL:String = "ExportToExcelServlet";
        private static function convertDGToHTMLTable(dg:AdvancedDataGrid,title:String):String {

            //Set default values
			var todaysDate:Date = new Date();
		    var todayDate:String = String(todaysDate);
            var font:String = dg.getStyle('fontFamily');

            var size:String = dg.getStyle('fontSize');

            var str:String = '';

            var colors:String = '';

            var style:String = 'style="background-color:#E1E1FB";"font-family:'+font+';font-size:'+size+'pt;"';                       
            var headerstyle:String = 'style="background-color:#CCCCCC";"font-family:'+font+';font-size:'+size+'pt;"';                       

            var hcolor:Array;

            //Retrieve the headercolor

            if(dg.getStyle("headerColor") != undefined) {

                  hcolor = [dg.getStyle("headerColor")];

            } else {

                  hcolor = dg.getStyle("headerColors");

            }                      

            //Set the htmltabel

            str+= '<table border="1" width="'+dg.width+'"><thead><tr  width="'+dg.width+'">';

            //Set the tableheader data (retrieves information from the datagrid header                     

            for(var i:int = 0;i<dg.columns.length;i++) {

                  colors = dg.getStyle("themeColor");

                  if(dg.columns[i].headerText == "Action"){

                        // skip it

                  }else if(dg.columns[i].headerText == "Origin Carriers"){

                        // skip this one too

                  }else if(dg.columns[i].headerText == "Destination Carriers"){

                        // skip this one too

                  }else if(dg.columns[i].headerText == "Carrier Phone"){

                        // skip this one too

                  }else{

                        if(dg.columns[i].headerText != undefined) {

                        str+="<th "+headerstyle+">"+dg.columns[i].headerText+"</th>";

                        } else {

                              str+= "<th "+headerstyle+">"+dg.columns[i].dataField+"</th>";

                        }

                  }    

            }

            str += "</tr></thead><tbody>";

            colors = dg.getStyle("alternatingRowColors");

            //Loop through the records in the dataprovider and

            //insert the column information into the table

            for(var j:int =0;j<dg.dataProvider.length;j++) {                             

                  str+="<tr width=\""+Math.ceil(dg.width)+"\">";

                  for(var k:int=0; k < dg.columns.length; k++) {

                        //Do we still have a valid item?                                 

                        if(dg.dataProvider.getItemAt(j) != undefined && dg.dataProvider.getItemAt(j) != null) {

                              if(dg.columns[k].labelFunction != undefined) {
                                    str += "<td height=\""+25+"\" width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.columns[k].labelFunction(dg.dataProvider.getItemAt(j),dg.columns[k])+"</td>";
                              }else {
                                    str += "<td height=\""+25+"\" width=\""+Math.ceil(dg.columns[k].width)+"\" "+style+">"+dg.dataProvider.getItemAt(j)[dg.columns[k].dataField]+"</td>";                             }
                        }
                  }
                  str += "</tr>";
            }
            str+="</tbody></table>";
            
            return "<b>"+title+"</b>"+ "\r\n"+ str;

        }
            /**

             * offers the excel download to the user.

             * @params: dg Datagrid The Datagrid that will be loaded into Excel

             */

        public static function loadDGInExcel(dg:AdvancedDataGrid ,title:String ,fileNameWithExtension:String):void {
	        try
			{
				var xlsData:String=new String();
				xlsData = convertDGToHTMLTable(dg,title);
				if (!downloadFileRef)
				{
					downloadFileRef=new FileReference();
				}
				var request:URLRequest = new URLRequest();
				request.url = EXPORT_CSV_URL;
				request.method = URLRequestMethod.POST;
				request.data = new URLVariables("csvdata=" + xlsData.split("&").join("%26"));
				downloadFileRef.download(request, fileNameWithExtension+"_"+CurrentDateTimeString()+".xls");
			}
			catch (e:Event)
			{
				Alert.show('Error Occured');
			}
			catch (event:IOErrorEvent)
			{
				Alert.show('IOErrorEvent Occured');
			}
        }      
		public static function CurrentDateTimeString():String
		{
  			var CurrentDateTime:Date = new Date();
   			var DateString:String = CurrentDateTime.getFullYear().toString()+"-"+doubleDigitFormat(Number(CurrentDateTime.getMonth()+1))+"-"+CurrentDateTime.getDate().toString();	
   			var TimeString:String = CurrentDateTime.getHours().toString()+"_"+doubleDigitFormat(CurrentDateTime.getMinutes())+"_"+doubleDigitFormat(CurrentDateTime.getSeconds());
   			var DateTimeString:String = DateString+"_"+TimeString;
   			return DateTimeString;
 		 }
 		public static function doubleDigitFormat(num:uint):String 
		{
  			if(num < 10) {
   				return ("0" + num);
  			}
   			return num.toString();
  		}
 
	} 

}

