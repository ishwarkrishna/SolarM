package com.machine.util
{
	public class DeviceLiveData
	{
		public var name:String;

        
        public var upsInputVolt:Number;
        public var upsOutputVolt:Number;
        public var upsOutputCur:Number;
        public var frequency:Number;

        public var batteryBank:Number;
        public var batteryPer:Number;
        public var dataAt:String;
        
        public var onEB:String;
        public var onBB:String;
        public var onSVR:String;
            	
		public function DeviceLiveData()
		{
			upsInputVolt=0;
			upsOutputVolt=0;
			upsOutputCur=0;
			frequency=0;
			batteryPer=0;
		
			onEB="OFF";
			onBB="OFF";
			onSVR="OFF"
			
			batteryBank=0;
			dataAt="";
			
		}

	}
}