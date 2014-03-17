
package com.scottlogic.charts
{
	import flash.display.DisplayObject;
	
	import org.alivepdf.display.Display;
	import org.alivepdf.layout.Orientation;
	import org.alivepdf.layout.Size;
	import org.alivepdf.layout.Unit;
	import org.alivepdf.pdf.PDF;
	import org.alivepdf.saving.Method;
	public class ChartExporter
	{
		private static const EXPORT_CSV_URL:String = "ExportToPDFServlet";
		
		public static function exportPDF (chartId:DisplayObject,reportName:String ):void
			{
				 var myPDF:PDF;
				// we create the PDF
				myPDF = new PDF(  Orientation.LANDSCAPE, Unit.MM, Size.A4 );
				// we set the zoom to 100%
				myPDF.setDisplayMode ( Display.FULL_PAGE ); 
				myPDF.setTitle(reportName);
				// we add a page
				myPDF.addPage();
				myPDF.addImage(chartId,null,0,0,myPDF.getMargins().width,myPDF.getMargins().height);
				myPDF.save( Method.REMOTE,EXPORT_CSV_URL , "chart.pdf",reportName,"Chart");
 
			}	
	}
}
