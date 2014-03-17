package util;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Formatter;
import java.util.Hashtable;
import java.util.Map;
import java.util.TimeZone;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.Session;
import org.jboss.netty.buffer.ChannelBuffer;

import com.macine.bean.HistoryDetails;
import com.macine.bean.HistoryDetailsToday;
import com.macine.bean.LatestData;
import com.macine.bean.MachineDetails;
import com.macine.bean.PacketDTO;

public class ChannelBufferTools {
    /**
     * Find string in network buffer
     */
    public static Integer find(
            ChannelBuffer buf,
            Integer start,
            Integer length,
            String subString) {

        int index = start;
        boolean match;

        for (; index < length; index++) {
            match = true;

            for (int i = 0; i < subString.length(); i++) {
                char c = (char) buf.getByte(index + i);
                if (c != subString.charAt(i)) {
                    match = false;
                    break;
                }
            }

            if (match) {
                return index;
            }
        }
        return null;
    }
    
    /**
     * Convert hex to integer (length in hex digits)
     */
    public static int readHexInteger(ChannelBuffer buf, int length) {
        
        int result = 0;
        
        for (int i = 0; i < length / 2; i++) {
            int b = buf.readUnsignedByte();
            result *= 10;
            result += b >>> 4;
            result *= 10;
            result += b & 0x0f;
        }
        
        if (length % 2 == 1) {
            int b = buf.getUnsignedByte(buf.readerIndex());
            result *= 10;
            result += b >>> 4;
        }
        
        return result;
    }

    /**
     * Return hex string
     */
    public static String readHexString(ChannelBuffer buf, int length) {
        
        StringBuilder result = new StringBuilder();
        Formatter formatter = new Formatter(result);
        
        for (int i = 0; i < length / 2; i++) {
            formatter.format("%02x", buf.readByte());
        }
        
        if (length % 2 == 1) {
            int b = buf.getUnsignedByte(buf.readerIndex());
            formatter.format("%01x", b >>> 4);
        }
        
        return result.toString();
    }
    
    /**
     * Return Protocol PacketDTO
     */
    public static Hashtable<String, String> readProtocol(ChannelBuffer buf) {
    	StringBuffer dataPacket =  new StringBuffer();
        for (int i = 0; i <= 210; i ++) {
            byte b = buf.getByte(i);
            dataPacket.append((char) b);
        }
        String[] data = dataPacket.toString().split(",");
        Hashtable<String, String> packetDataMap = new Hashtable<String, String>();
        //PacketDTO packetDTO = new PacketDTO();
        //packetDTO.setImeiNo(data[1]);
        packetDataMap.put(Constants.IMEI_NO, data[1]);
        //packetDTO.setPacket(dataPacket.toString());
        packetDataMap.put("packets", dataPacket.toString());
     // Time
        Calendar time = Calendar.getInstance();
        time.clear();
        System.out.println("Timestamp.."+(2000 + Integer.valueOf(data[7]))+"-"+Integer.valueOf(data[6])+"-"+Integer.valueOf(data[5])+" "+
        		Integer.valueOf(data[2])+":"+Integer.valueOf(data[3])+":"+Integer.valueOf(data[4]));
        time.set((2000 + Integer.valueOf(data[7])),(Integer.valueOf(data[6])-1),Integer.valueOf(data[5]),
        		Integer.valueOf(data[2]),Integer.valueOf(data[3]),Integer.valueOf(data[4]));
        //packetDTO.setTimestamp(new Timestamp(time.getTimeInMillis()));
        packetDataMap.put(Constants.TIMESTAMP, time.getTimeInMillis()+"");
        packetDataMap.put(Constants.DATA1,data[8]);
        packetDataMap.put(Constants.DATA2,data[9]);
        packetDataMap.put(Constants.DATA3,data[10]);
        packetDataMap.put(Constants.DATA4,data[11]);
        packetDataMap.put(Constants.DATA5,data[12]);
        packetDataMap.put(Constants.DATA6,data[13]);
        packetDataMap.put(Constants.DATA7,data[14]);
        packetDataMap.put(Constants.DATA8,(Double.parseDouble(data[15])*1000)+"");
        packetDataMap.put(Constants.DATA9,(Double.parseDouble(data[16])*1000)+"");        
        packetDataMap.put(Constants.DATA10,(Double.parseDouble(data[19])*1000)+"");
        packetDataMap.put(Constants.DATA11,(Double.parseDouble(data[24])/1000)+"");
        packetDataMap.put(Constants.DATA12,(Double.parseDouble(data[25])/1000)+"");
        packetDataMap.put(Constants.DATA13,(Double.parseDouble(data[26])/1000)+"");
        
        return packetDataMap;
    }
    
    /**
     * Return Protocol HashTable
     */
    public static Hashtable<String, String> readProtocol1(ChannelBuffer buf) {
    	Hashtable<String, String> packetDataMap = new Hashtable<String, String>();
    	StringBuffer dataPacket =  new StringBuffer();
        for (int i = 0; i <= 343; i ++) {
            byte b = buf.getByte(i);
            dataPacket.append((char) b);
        }

		 
        //String[] data = dataPacket.toString().split(" ");
       
        System.out.println("dataPacket.toString()........."+dataPacket.toString());
        Log.fineAndSysOut("Date                 "+dataPacket.substring(23, 31));
    	Log.fineAndSysOut("Time                 "+dataPacket.substring(31, 39));
        packetDataMap.put(Constants.IMEI_NO, dataPacket.substring(7, 23));
        packetDataMap.put("packets", dataPacket.toString());     
        packetDataMap.put(Constants.TIMESTAMP, System.currentTimeMillis()+"");    	
        packetDataMap.put(Constants.DATA10, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(53, 61)))+"");
        packetDataMap.put(Constants.DATA39, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(61, 69)))+"");
        packetDataMap.put(Constants.DATA38,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(69, 77)))+"");
        packetDataMap.put(Constants.DATA37,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(77, 85)))+"");
        packetDataMap.put(Constants.DATA36,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(85, 93)))+"");
        packetDataMap.put(Constants.DATA35,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(93, 101)))+"");
        packetDataMap.put(Constants.DATA34,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(101, 109)))+"");
        packetDataMap.put(Constants.DATA33,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(109, 117)))+"");
    	packetDataMap.put(Constants.DATA32,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(117, 125)))+"");
    	packetDataMap.put(Constants.DATA31,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(125, 133)))+"");
    	packetDataMap.put(Constants.DATA30,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(133, 141)))+"");
    	packetDataMap.put(Constants.DATA29,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(141, 149)))+"");
    	packetDataMap.put(Constants.DATA28,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(149, 157)))+"");
    	packetDataMap.put(Constants.DATA27,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(157, 165)))+"");
    	packetDataMap.put(Constants.DATA26,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(165, 173)))+"");
    	packetDataMap.put(Constants.DATA25,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(173, 181)))+"");
    	packetDataMap.put(Constants.DATA24,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(181, 189)))+"");
        packetDataMap.put(Constants.DATA23,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(189, 197)))+"");
        packetDataMap.put(Constants.DATA22,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(197, 205)))+"");
    	packetDataMap.put(Constants.DATA21,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(205, 213)))+"");
    	packetDataMap.put(Constants.DATA20, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(213, 221)))+"");
    	packetDataMap.put(Constants.DATA4,Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(221, 229)))+"");
        packetDataMap.put(Constants.DATA19, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(229, 237)))+"");
        packetDataMap.put(Constants.DATA18, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(237, 245)))+"");
        packetDataMap.put(Constants.DATA7, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(245, 253)))+"");
        packetDataMap.put(Constants.DATA17, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(253, 261)))+"");
        packetDataMap.put(Constants.DATA16, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(261, 269)))+"");
        packetDataMap.put(Constants.DATA15, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(269, 277)))+"");
        packetDataMap.put(Constants.DATA14, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(277, 285)))+"");
        packetDataMap.put(Constants.DATA13, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(285, 293)))+"");
        packetDataMap.put(Constants.DATA1, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(303, 311)))+"");
        packetDataMap.put(Constants.DATA5, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(311, 319)))+"");
        packetDataMap.put(Constants.DATA8, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(319, 327)))+"");
        //packetDataMap.put(Constants.DATA10, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(245, 253)))+"");
        packetDataMap.put(Constants.DATA11, Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(327, 335)))+"");

    	//Log.fineAndSysOut("START OF STRING           "+ChannelBufferTools.readHexString(buf, 1));
    	//Log.fineAndSysOut("F/ P           "+ChannelBufferTools.readHexString(buf, 2));
    	Log.fineAndSysOut("Packect ID           "+dataPacket.substring(3,7));
    	Log.fineAndSysOut("IMEI                 "+dataPacket.substring(7, 23));
    	Log.fineAndSysOut("Date                 "+dataPacket.substring(23, 31));
    	Log.fineAndSysOut("Time                 "+dataPacket.substring(31, 39));
    	Log.fineAndSysOut("Data Length          "+dataPacket.substring(39, 43));
    	Log.fineAndSysOut("Software Version     "+dataPacket.substring(43, 45));
    	Log.fineAndSysOut("STATUS BIT           "+dataPacket.substring(45, 47));
    	Log.fineAndSysOut("Slave ID             "+dataPacket.substring(47, 49));
    	Log.fineAndSysOut("Function Code        "+dataPacket.substring(49, 51));
    	Log.fineAndSysOut("Byte Count           "+dataPacket.substring(51, 53));
    	Log.fineAndSysOut("Watts Total          "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(53, 61))));
    	Log.fineAndSysOut("Watts R Phase        "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(61, 69))));
    	Log.fineAndSysOut("Watts y Phase        "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(69, 77))));
    	Log.fineAndSysOut("Watts B Phase        "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(77, 85))));
    	Log.fineAndSysOut("VAR total            "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(85, 93))));
    	Log.fineAndSysOut("VAR R Phase          "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(93, 101))));
    	Log.fineAndSysOut("VAR y Phase          "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(101, 109))));
    	Log.fineAndSysOut("VAR B Phase          "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(109, 117))));
    	Log.fineAndSysOut("PF Ave.(Inst)        "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(117, 125))));
    	Log.fineAndSysOut("PF R Phase           "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(125, 133))));
    	Log.fineAndSysOut("PF y Phase           "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(133, 141))));
    	Log.fineAndSysOut("PF B Phase           "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(141, 149))));
    	Log.fineAndSysOut("VA total             "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(149, 157))));
    	Log.fineAndSysOut("VA R Phase           "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(157, 165))));
    	Log.fineAndSysOut("VA y Phase           "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(165, 173))));
    	Log.fineAndSysOut("VA B Phase           "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(173, 181))));
    	Log.fineAndSysOut("VLL average          "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(181, 189))));
    	Log.fineAndSysOut("Vry Phase            "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(189, 197))));
    	Log.fineAndSysOut("Vyb Phase            "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(197, 205))));
    	Log.fineAndSysOut("Vbr Phase            "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(205, 213))));
    	Log.fineAndSysOut("VLN average          "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(213, 221))));
    	Log.fineAndSysOut("V R Phase            "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(221, 229))));
    	Log.fineAndSysOut("V y Phase            "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(229, 237))));
    	Log.fineAndSysOut("V B Phase            "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(237, 245))));
    	Log.fineAndSysOut("Current Total        "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(245, 253))));
    	Log.fineAndSysOut("Current  R Phase     "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(253, 261))));
    	Log.fineAndSysOut("Current  y Phase     "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(261, 269))));
    	Log.fineAndSysOut("Current  B Phase     "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(269, 277))));
    	Log.fineAndSysOut("Frequency            "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(277, 285))));
    	Log.fineAndSysOut("Wh Received          "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(285, 293))));
    	Log.fineAndSysOut("CRC low              "+dataPacket.substring(293, 295));
    	Log.fineAndSysOut("CRC High             "+dataPacket.substring(295, 297));
    	
    	Log.fineAndSysOut("Slave ID             "+dataPacket.substring(297, 299));
    	Log.fineAndSysOut("Function Code        "+dataPacket.substring(299, 301));
    	Log.fineAndSysOut("Byte Count           "+dataPacket.substring(301, 303));
    	Log.fineAndSysOut("Voltage              "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(303, 311))));
    	Log.fineAndSysOut("Current              "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(311, 319))));
    	Log.fineAndSysOut("Watts                "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(319, 327))));
    	Log.fineAndSysOut("Kwh                  "+Helper.convertHexaTo32BitsFloat(Helper.hexSwap(dataPacket.substring(327, 335))));
    	Log.fineAndSysOut("CRC low              "+dataPacket.substring(335, 337));
    	Log.fineAndSysOut("CRC High             "+dataPacket.substring(337, 339));
    	Log.fineAndSysOut("CRC 16 bit           "+dataPacket.substring(339, 341));

        return packetDataMap;
    }

    /**
     * Return Protocol HashTable
     */
    public static Hashtable<String, String> readProtocolLevel(ChannelBuffer buf) {
    	Hashtable<String, String> packetDataMap = new Hashtable<String, String>();
    	StringBuffer dataPacket =  new StringBuffer();
        for (int i = 0; i <= 83; i ++) {
            byte b = buf.getByte(i);
            dataPacket.append((char) b);
        }

		 
        System.out.println("dataPacket.toString()........."+dataPacket.toString());
        Log.fineAndSysOut("Date                 "+dataPacket.substring(23, 31));
    	Log.fineAndSysOut("Time                 "+dataPacket.substring(31, 39));
        packetDataMap.put(Constants.IMEI_NO, dataPacket.substring(7, 23));
        packetDataMap.put("packets", dataPacket.toString());     
        packetDataMap.put(Constants.TIMESTAMP, System.currentTimeMillis()+"");    	
        packetDataMap.put(Constants.DATA1, ((Double.parseDouble(Helper.hexToDecimal(dataPacket.substring(53, 57))))/10)+"");
        packetDataMap.put(Constants.DATA2, Helper.convertHexToBin(dataPacket.substring(57, 61)).substring(1, 2));
        packetDataMap.put(Constants.DATA3, Helper.convertHexToBin(dataPacket.substring(57, 61)).substring(2, 3));
        packetDataMap.put(Constants.DATA4, Helper.convertHexToBin(dataPacket.substring(57, 61)).substring(3, 4));
        packetDataMap.put(Constants.DATA5, Helper.hexToDecimal(dataPacket.substring(71, 75))+"");
        

    	//Log.fineAndSysOut("START OF STRING           "+ChannelBufferTools.readHexString(buf, 1));
    	//Log.fineAndSysOut("F/ P           "+ChannelBufferTools.readHexString(buf, 2));
    	Log.fineAndSysOut("Packect ID           "+dataPacket.substring(3,7));
    	Log.fineAndSysOut("IMEI                 "+dataPacket.substring(7, 23));
    	Log.fineAndSysOut("Date                 "+dataPacket.substring(23, 31));
    	Log.fineAndSysOut("Time                 "+dataPacket.substring(31, 39));
    	Log.fineAndSysOut("Data Length          "+dataPacket.substring(39, 43));
    	Log.fineAndSysOut("Software Version     "+dataPacket.substring(43, 45));
    	Log.fineAndSysOut("STATUS BIT           "+dataPacket.substring(45, 47));
    	Log.fineAndSysOut("Slave ID             "+dataPacket.substring(47, 49));
    	Log.fineAndSysOut("Function Code        "+dataPacket.substring(49, 51));
    	Log.fineAndSysOut("Byte Count           "+dataPacket.substring(51, 53));

    	//Log.fineAndSysOut("Temperature          "+dataPacket.substring(53, 57));
    	//Log.fineAndSysOut("Door open status     "+dataPacket.substring(57, 61));
    	
    	Log.fineAndSysOut("Temperature          "+((Double.parseDouble(Helper.hexToDecimal(dataPacket.substring(53, 57))))/10)+"");
    	Log.fineAndSysOut("Door open status     "+Helper.convertHexToBin(dataPacket.substring(57, 61)));
    	Log.fineAndSysOut("CRC low              "+dataPacket.substring(61, 63));
    	Log.fineAndSysOut("CRC High             "+dataPacket.substring(63, 65));
    	
    	Log.fineAndSysOut("Slave ID             "+dataPacket.substring(65, 67));
    	Log.fineAndSysOut("Function Code        "+dataPacket.substring(67, 69));
    	Log.fineAndSysOut("Byte Count           "+dataPacket.substring(69, 71));
    
    	//Log.fineAndSysOut("Level           "+dataPacket.substring(71, 75));
        
    	Log.fineAndSysOut("Level              "+Helper.hexToDecimal(dataPacket.substring(71, 75)));
    	
    	Log.fineAndSysOut("CRC low              "+dataPacket.substring(75, 77));
    	Log.fineAndSysOut("CRC High             "+dataPacket.substring(77, 79));
    	Log.fineAndSysOut("CRC 16 bit           "+dataPacket.substring(79, 83));

        return packetDataMap;
    }

    
    
    
    /**
     * Return Protocol PacketDTO
     */
    public static boolean updateHistory(Session session, Hashtable<String, String> packetDataHashtable,
    		MachineDetails machineDetails) throws Exception {
    	HistoryDetails historyDetails = new HistoryDetails();
        historyDetails.setMachineDetails(machineDetails);
        historyDetails.setDataTimestamp(new Timestamp(Long.valueOf(packetDataHashtable.get(Constants.TIMESTAMP))));        
        historyDetails.setData1(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA1)));
        historyDetails.setData2(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA2)));
        historyDetails.setData3(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA3)));
        historyDetails.setData4(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA4)));
        historyDetails.setData5(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA5)));
        historyDetails.setData6(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA6)));
        historyDetails.setData7(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA7)));
        historyDetails.setData8(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA8)));
        historyDetails.setData9(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA9)));        
        historyDetails.setData10(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA10)));
        historyDetails.setData11(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA11)));
        historyDetails.setData12(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA12)));
        historyDetails.setData13(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA13)));
        
        HistoryDetailsToday historyDetailsToday = new HistoryDetailsToday();
        historyDetailsToday.setMachineDetails(machineDetails);
        historyDetailsToday.setDataTimestamp(new Timestamp(Long.valueOf(packetDataHashtable.get(Constants.TIMESTAMP))));        
        historyDetailsToday.setData1(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA1)));
        historyDetailsToday.setData2(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA2)));
        historyDetailsToday.setData3(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA3)));
        historyDetailsToday.setData4(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA4)));
        historyDetailsToday.setData5(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA5)));
        historyDetailsToday.setData6(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA6)));
        historyDetailsToday.setData7(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA7)));
        historyDetailsToday.setData8(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA8)));
        historyDetailsToday.setData9(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA9)));        
        historyDetailsToday.setData10(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA10)));
        historyDetailsToday.setData11(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA11)));
        historyDetailsToday.setData12(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA12)));
        historyDetailsToday.setData13(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA13)));
        
        session.save(historyDetails);
        session.save(historyDetailsToday);        
        return true;
    }	
    
    
    /**
     * Protocol2 UpdateHistory
     */
    public static boolean updateHistoryForProtocol2(Session session, Hashtable<String, String> packetDataHashtable,
    		MachineDetails machineDetails) throws Exception {
    	HistoryDetails historyDetails = new HistoryDetails();
        historyDetails.setMachineDetails(machineDetails);
        historyDetails.setDataTimestamp(new Timestamp(Long.valueOf(packetDataHashtable.get(Constants.TIMESTAMP))));        
        historyDetails.setData1(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA1)));
        //historyDetails.setData2(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA2)));
        //historyDetails.setData3(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA3)));
        historyDetails.setData4(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA4)));
        historyDetails.setData5(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA5)));
        //historyDetails.setData6(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA6)));
        historyDetails.setData7(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA7)));
        historyDetails.setData8(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA8)));
        //historyDetails.setData9(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA9)));        
        //historyDetails.setData10(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA10)));
        historyDetails.setData11(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA11)));
        historyDetails.setData13(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA13)));
        historyDetails.setData14(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA14)));        
        historyDetails.setData15(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA15)));
        historyDetails.setData16(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA16)));
        historyDetails.setData17(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA17)));
        historyDetails.setData18(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA18)));
        historyDetails.setData19(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA19)));
        historyDetails.setData20(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA20)));
        historyDetails.setData21(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA21)));
        historyDetails.setData22(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA22)));
        historyDetails.setData23(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA23)));
        historyDetails.setData24(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA24)));
        historyDetails.setData25(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA25)));
        historyDetails.setData26(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA26)));
        historyDetails.setData27(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA27)));
        historyDetails.setData28(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA28)));
        historyDetails.setData29(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA29)));
        historyDetails.setData30(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA30)));
        historyDetails.setData31(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA31)));
        historyDetails.setData32(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA32)));
        historyDetails.setData33(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA33)));
        historyDetails.setData34(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA34)));
        historyDetails.setData35(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA35)));
        historyDetails.setData36(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA36)));
        historyDetails.setData37(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA37)));
        historyDetails.setData38(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA38)));
        historyDetails.setData39(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA39)));
        
        
        HistoryDetailsToday historyDetailsToday = new HistoryDetailsToday();
        historyDetailsToday.setMachineDetails(machineDetails);
        historyDetailsToday.setDataTimestamp(new Timestamp(Long.valueOf(packetDataHashtable.get(Constants.TIMESTAMP))));        
        historyDetailsToday.setData1(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA1)));
        //historyDetailsToday.setData2(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA2)));
        //historyDetailsToday.setData3(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA3)));
        historyDetailsToday.setData4(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA4)));
        historyDetailsToday.setData5(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA5)));
        //historyDetailsToday.setData6(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA6)));
        historyDetailsToday.setData7(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA7)));
        historyDetailsToday.setData8(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA8)));
        //historyDetailsToday.setData9(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA9)));        
        //historyDetailsToday.setData10(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA10)));
        historyDetailsToday.setData11(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA11)));
        historyDetailsToday.setData13(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA13)));
        historyDetailsToday.setData14(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA14)));        
        historyDetailsToday.setData15(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA15)));
        historyDetailsToday.setData16(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA16)));
        historyDetailsToday.setData17(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA17)));
        historyDetailsToday.setData18(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA18)));
        historyDetailsToday.setData19(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA19)));
        historyDetailsToday.setData20(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA20)));
        historyDetailsToday.setData21(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA21)));
        historyDetailsToday.setData22(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA22)));
        historyDetailsToday.setData23(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA23)));
        historyDetailsToday.setData24(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA24)));
        historyDetailsToday.setData25(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA25)));
        historyDetailsToday.setData26(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA26)));
        historyDetailsToday.setData27(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA27)));
        historyDetailsToday.setData28(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA28)));
        historyDetailsToday.setData29(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA29)));
        historyDetailsToday.setData30(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA30)));
        historyDetailsToday.setData31(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA31)));
        historyDetailsToday.setData32(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA32)));
        historyDetailsToday.setData33(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA33)));
        historyDetailsToday.setData34(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA34)));
        historyDetailsToday.setData35(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA35)));
        historyDetailsToday.setData36(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA36)));
        historyDetailsToday.setData37(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA37)));
        historyDetailsToday.setData38(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA38)));
        historyDetailsToday.setData39(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA39)));
        
        session.save(historyDetails);
        session.save(historyDetailsToday);        
        return true;
    }	
    
    /**
     * Protocol2 UpdateHistory
     */
    public static boolean updateHistoryForLevel(Session session, Hashtable<String, String> packetDataHashtable,
    		MachineDetails machineDetails) throws Exception {
    	HistoryDetails historyDetails = new HistoryDetails();
        historyDetails.setMachineDetails(machineDetails);
        historyDetails.setDataTimestamp(new Timestamp(Long.valueOf(packetDataHashtable.get(Constants.TIMESTAMP))));        
        historyDetails.setData1(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA1)));
        historyDetails.setData2(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA2)));
        historyDetails.setData3(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA3)));
        historyDetails.setData4(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA4)));
        historyDetails.setData5(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA5)));
              
        
        HistoryDetailsToday historyDetailsToday = new HistoryDetailsToday();
        historyDetailsToday.setMachineDetails(machineDetails);
        historyDetailsToday.setDataTimestamp(new Timestamp(Long.valueOf(packetDataHashtable.get(Constants.TIMESTAMP))));        
        historyDetailsToday.setData1(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA1)));
        historyDetailsToday.setData2(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA2)));
        historyDetailsToday.setData3(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA3)));
        historyDetailsToday.setData4(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA4)));
        historyDetailsToday.setData5(Helper.getFormattedDoubleValue(packetDataHashtable.get(Constants.DATA5)));
        
        
        session.save(historyDetails);
        session.save(historyDetailsToday);        
        return true;
    }	
}
