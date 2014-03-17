/**
	_________________________________________________________________________________________________________________

	AdvancedDataGridExporter is a util-class to export AdvancedDataGrid's data into different format.	
	@class AdvancedDataGridExporter (public)
	@author Vidya Sagar Reddy Bojja 
	__________________________________________________________________________________________________________________

*/


package com.scottlogic.charts
{
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import mx.controls.AdvancedDataGrid;
	
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.collections.IViewCursor;
	
	public class AdvancedDataGridExporter
	{
		public static function exportCSV(dg:AdvancedDataGrid,title:String, csvSeparator:String="\t", lineSeparator:String="\n"):String
		{
			var todaysDate:Date = new Date();
		    var todayDate:String = String(todaysDate);
			var data:String = "";
			var columns:Array = dg.columns;
			var columnCount:int = columns.length;
			var column:AdvancedDataGridColumn;
			var header:String = "";
			var headerGenerated:Boolean = false;
			var dataProvider:Object = dg.dataProvider;
			var rowCount:int = dataProvider.length;
			var dp:Object = null;

			var cursor:IViewCursor = dataProvider.createCursor ();
			var j:int = 0;
			//loop through rows
			while (!cursor.afterLast)
			{
				var obj:Object = null;
				obj = cursor.current;
				
				//loop through all columns for the row
				for(var k:int = 0; k < columnCount; k++)
				{
					column = columns[k];

					//Exclude column data which is invisible (hidden)
					if(!column.visible)
					{
						continue;
					}
				
					data += "\""+ column.itemToLabel(obj)+ "\"";

					if(k < (columnCount -1))
					{
						data += csvSeparator;
					}
					//generate header of CSV, only if it's not genereted yet
					if (!headerGenerated)
					{
						header += "\"" + column.headerText + "\"";
						if (k < columnCount - 1)
						{
							header += csvSeparator;
						}
					}			
				}
				
				headerGenerated = true;

				if (j < (rowCount - 1))
				{
					data += lineSeparator;
				}

				j++;
				cursor.moveNext ();
			}
			
			//set references to null:
			dataProvider = null;
			columns = null;
			column = null;
			return (title+"\t\t\t\t"+todayDate +"\r\n" + header + "\r\n" + data);
		}	
		
		private static const EXPORT_CSV_URL:String = "ExportToExcelServlet";
		private static var downloadFileRef:FileReference = null;
		
		public static function callExportCSV(dataGridFromFlex,title):void
		{
		
		var csvData:String = exportCSV(dataGridFromFlex,title,"\t","\n");
		
		var console:String = csvData;
		if (csvData.length > 0)
		{
		downloadCSV (csvData);
		}
		}
		
		public static function downloadCSV(csvData:String):void
		{
		if (downloadFileRef == null)
		{
		downloadFileRef = new FileReference();
		}
		var request:URLRequest = new URLRequest();
		request.url = EXPORT_CSV_URL;
		request.method = URLRequestMethod.POST;
		request.data = new URLVariables("csvdata=" + csvData);
		downloadFileRef.download(request,"Report.xls");
		} 
	}
}