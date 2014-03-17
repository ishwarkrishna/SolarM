package com.machine.util
{
	public class DeviceLiveData
	{
		public var name:String;

        public var rVolt:Number;
        public var yVolt:Number;
        public var bVolt:Number;
        
        public var upsInputVolt:Number;
        public var upsOutputVolt:Number;
        public var upsFaultVolt:Number;
        public var frequency:Number;

        public var ac1Load:Number;
        public var ac2Load:Number;
        public var sLLoad:Number;
        public var lfLoad:Number;

        public var batteryBank:Number;
        public var temperature:Number;
        public var dataAt:String;
        
        public var onEB:String;
        public var onBB:String;
        public var onSVR:String;
            	
		public function DeviceLiveData()
		{
			rVolt=0;			
			yVolt=0;
			bVolt=0;
			
			upsInputVolt=0;
			upsOutputVolt=0;
			upsFaultVolt=0;
			frequency=0;
			
			ac1Load=0
			ac2Load=0
			sLLoad=0
			lfLoad=0
			
			onEB="OFF";
			onBB="OFF";
			onSVR="OFF"
			
			batteryBank=0;
			temperature=0;
			dataAt="";
			
		}

	}
}