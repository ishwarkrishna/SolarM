/**
	_________________________________________________________________________________________________________________

	DataGridExporter is a util-class to export DataGrid's data into different format.	
	@class DataGridExporter (public)
	@author Manoranjan Singh 
	__________________________________________________________________________________________________________________

*/
package com.scottlogic.charts
{
	
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import mx.collections.IViewCursor;
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Alert;
	import mx.controls.DataGrid;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.controls.dataGridClasses.DataGridColumn;
	
	public class DataGridExporter
	{

		public static function exportCSV(dg:DataGrid, csvSeparator:String="\t", lineSeparator:String="\n"):String
		{
			var data:String = "";
			var columns:Array = dg.columns;
			var columnCount:int = columns.length;
			var column:DataGridColumn;
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
		
			return (header + "\r\n" + data);
			
		}	
		public static function exportADGToCSV(dg:AdvancedDataGrid, csvSeparator:String="\t", lineSeparator:String="\n"):String
		{
			
			var data:String = "";
			var header:String = "";
			try{
			var columns:Array = dg.columns;
			var columnCount:int = columns.length;
			var column:AdvancedDataGridColumn;
			var headerGenerated:Boolean = false;
			var dataProvider:Object = dg.dataProvider;
			var rowCount:int = dataProvider.length;
			var dp:Object = null;

			var cursor:IViewCursor = dataProvider.createCursor();
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
		
			}catch(error:Error){
				Alert.show("error in export ADG To CSV....."+error.message.toString());
			}
			return (header + "\r\n" + data);
			
		}
		private static const EXPORT_CSV_URL:String = "ExportToExcelServlet";
		private static var downloadFileRef:FileReference = null;
		
		public static function callExportCSV(dataGridFromFlex:DataGrid):void
		{
			var csvData:String = exportCSV(dataGridFromFlex,"\t","\n");
			var console:String = csvData;
			if (csvData.length > 0)
			{
				downloadCSV (csvData);
			}
		}
		
		public static function callExportADGToCSV(dataGridFromFlex:AdvancedDataGrid,fileLabelName:String):void
		{
			var csvData:String = exportADGToCSV(dataGridFromFlex,"\t","\n");
			var console:String = csvData;
			if (csvData.length > 0)
			{
				downloadAdgCSV(csvData,fileLabelName);
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
		
		public static function downloadAdgCSV(csvData:String,fileLabelName:String):void
		{
			if (downloadFileRef == null)
			{
				downloadFileRef = new FileReference();
			}
			try{
				var currentDateAndTime:Date = new Date(); 
				var request:URLRequest = new URLRequest();
				request.url = EXPORT_CSV_URL;
				request.method = URLRequestMethod.POST;
				request.data = new URLVariables("csvdata=" + csvData);
				downloadFileRef.download(request,fileLabelName+".xls");
			}catch(error:Error){
				Alert.show("error in downloadCSV...."+error.message);
			}
		} 
	}
}
