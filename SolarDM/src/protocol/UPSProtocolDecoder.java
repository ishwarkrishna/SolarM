package protocol;

import java.nio.charset.Charset;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.buffer.ChannelBuffers;
import org.jboss.netty.buffer.HeapChannelBufferFactory;
import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelHandlerContext;
import dm.BaseProtocolDecoder;
import dm.ServerManager;
import util.ChannelBufferTools;
import util.Helper;
import util.Log;
import model.Position;

public class UPSProtocolDecoder extends BaseProtocolDecoder {

    /**
     * Initialize
     */
    public UPSProtocolDecoder(ServerManager serverManager) {
        super(serverManager);
    }

    /**
     * Decode regular message
     */
    private Position decodeNormalMessage(ChannelBuffer buf,Channel channel) throws Exception {

        Position position = new Position();

        buf.readByte(); // header "<"
        buf.readByte(); // P/F
        
        Log.fineAndSysOut("****************************************");
        Log.fineAndSysOut(" Message Received(host/port): " + channel.getLocalAddress().toString());
        Log.fineAndSysOut("****************************************");
        Log.fineAndSysOut("Packet ID:        "+Integer.parseInt(ChannelBufferTools.readHexString(buf, 4),16)); // length

        // Get device by identifier
        //String id = Long.valueOf(ChannelBufferTools.readHexString(buf, 16)).toString();
        
        Log.fineAndSysOut("MAC Address:      "+ChannelBufferTools.readHexString(buf, 16));
        long millis = Helper.convertGMTtoLocalMillis(Long.parseLong(ChannelBufferTools.readHexString(buf, 8), 16) * 1000);        
        Log.fineAndSysOut("UTC Time stamp:   "+ Helper.getCurrentTimeStamp(millis, "yyyy-MM-dd HH:mm:ss"));         
        Log.fineAndSysOut("Data Length:      "+Integer.parseInt(ChannelBufferTools.readHexString(buf, 4),16)); 
        Log.fineAndSysOut("Ethernet Version: "+Integer.parseInt(ChannelBufferTools.readHexString(buf, 2),16)); 
        Log.fineAndSysOut("Analog Version:   "+Integer.parseInt(ChannelBufferTools.readHexString(buf, 4),16)); 
        
        Log.fineAndSysOut("UPS I/P:          "+(Double.parseDouble(Helper.hexToDecimal(ChannelBufferTools.readHexString(buf, 4)))));
        Log.fineAndSysOut("UPS O/P:          "+(Double.parseDouble(Helper.hexToDecimal(ChannelBufferTools.readHexString(buf, 4)))));
        Log.fineAndSysOut("% of Battery:     "+(Double.parseDouble(Helper.hexToDecimal(ChannelBufferTools.readHexString(buf, 4))))/10);
        Log.fineAndSysOut("Current:          "+(Double.parseDouble(Helper.hexToDecimal(ChannelBufferTools.readHexString(buf, 4))))/10);
        Log.fineAndSysOut("Frequency:        "+(Double.parseDouble(Helper.hexToDecimal(ChannelBufferTools.readHexString(buf, 4))))/10);
        Log.fineAndSysOut("Battery Voltage:  "+(Double.parseDouble(Helper.hexToDecimal(ChannelBufferTools.readHexString(buf, 4))))/10);

        String alarmStatusHex = ChannelBufferTools.readHexString(buf, 4);
        Log.fineAndSysOut("Status in HEX:    "+alarmStatusHex+" Binary: "+Helper.convertHexToBin(alarmStatusHex)); // length
        Log.fineAndSysOut("Reserved:         "+Integer.parseInt(ChannelBufferTools.readHexString(buf, 4),16)); // length
        Log.fineAndSysOut("Reserved:         "+Integer.parseInt(ChannelBufferTools.readHexString(buf, 4),16)); // length
        ChannelBufferTools.readHexString(buf, 4);
        
        byte endChar = buf.getByte(0);
        ChannelBufferTools.readHexString(buf, 2);  

        //byte[] response = {0x54, 0x68, 0x1A, 0x0D, 0x0A};
        
        byte[] idToResp = new byte[10];
        buf.getBytes(2, idToResp);
 
        ChannelBuffer sendBuf = HeapChannelBufferFactory.getInstance().getBuffer(18);
        sendBuf.writeByte('<');
        sendBuf.writeBytes(idToResp);
        sendBuf.writeByte(0x00);
        sendBuf.writeByte(';');

        channel.write(sendBuf);
        
       // channel.write(ChannelBuffers.wrappedBuffer(response));
        
        return position;
    }    

    /**
     * Decode message
     */
    protected Object decode(
            ChannelHandlerContext ctx, Channel channel, Object msg)
            throws Exception {

    	ChannelBuffer buf = (ChannelBuffer) msg;
        char first = (char) buf.getByte(0);

        // Check message type
        if (first == '<') {        	
        	return decodeNormalMessage(buf,channel);
        } 

        return null;
    }

}
