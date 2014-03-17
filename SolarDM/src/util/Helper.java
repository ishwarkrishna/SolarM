package util;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class Helper {
	public static String hexToDecimal(String token)
	{
		String decimal = "";
		long i = Long.parseLong(token, 16);
		decimal = String.valueOf(i);
		return decimal;
	}
	
	/**
	 *  Used for IEEE Conversion.
	 */
	public static float convertHexaTo32BitsFloat(String hexaValue)
	{
		float convertedFloat;
		try
		{
			int bits = Integer.parseInt(hexaValue, 16);
			convertedFloat = Float.intBitsToFloat(bits);
			String temp = Float.toString(convertedFloat);
			// If converted value is an exponential value then discard it.
			if (0 <= temp.indexOf("E") || 0 <= temp.indexOf("e"))
			{
				//convertedFloat = -1;
				convertedFloat = 0;
			}

		}
		catch (Exception e)
		{
			convertedFloat = -1;
			System.out.println("Error in converting the hex to 32 bit float :"+e);
		}
		return convertedFloat;
	}

	
	public static String convertHexToBin(String hexNum)
	{
		StringBuffer sb = new StringBuffer();
		int[] binNum = new int[4 * hexNum.length()];
		for (int i = 0; i < hexNum.length(); i++)
		{
			char aChar = hexNum.charAt(i);
			int theDigit = Character.digit(aChar, 16);
			binNum[4 * i] = theDigit / 8;
			theDigit = theDigit % 8;
			binNum[4 * i + 1] = theDigit / 4;
			theDigit = theDigit % 4;
			binNum[4 * i + 2] = theDigit / 2;
			theDigit = theDigit % 2;
			binNum[4 * i + 3] = theDigit;
		}
		for (int i = 0; i < binNum.length; i++)
		{
			sb.append(binNum[i]);
		}
		return sb.toString();
	}
	
	public static long convertGMTtoLocalMillis(long gmtMillis)
	{
		try
		{
			SimpleDateFormat dateFormatGmt = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss");
			dateFormatGmt.setTimeZone(TimeZone.getTimeZone("GMT"));

			//Local time zone    
			SimpleDateFormat dateFormatLocal = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss");

			//Time in GMT 
			Date dd = Calendar.getInstance().getTime();
			dd.setTime(gmtMillis);
			Date ddd = dateFormatLocal.parse(dateFormatGmt.format(dd));

			return ddd.getTime();
		}
		catch (Exception e)
		{
			Log.severe("Exception in converting GMT millis to Local :" + e.getMessage());
		}

		return gmtMillis;
	}
	
	public static String getCurrentTimeStamp(long timestamp, String format)
	{
		SimpleDateFormat formatter = new SimpleDateFormat(format);
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(timestamp);
		return formatter.format(calendar.getTime());
	}
	
	public static String hexSwap(String hexValue)
	{
		return hexValue.substring(4,8)+hexValue.substring(0,4);
	}
	
	private final SimpleDateFormat sdf =
		    new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		    { sdf.setTimeZone(TimeZone.getTimeZone("GMT")); }
	
	public long parseTimeToMillis(final String timeStamp) throws Exception
    { return sdf.parse(timeStamp).getTime(); }
	
	public static Double getFormattedDoubleValue(String value) throws ParseException{
		DecimalFormat df=new DecimalFormat("##.00");
		String formate = df.format(Double.parseDouble(value)); 
		double finalValue = Double.parseDouble(df.parse(formate).toString());
		return finalValue;
	}
}
