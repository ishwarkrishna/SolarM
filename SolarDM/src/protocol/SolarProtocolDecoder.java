package protocol;

import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.util.Hashtable;
import java.util.List;
import java.util.regex.Pattern;

import model.Position;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.buffer.HeapChannelBufferFactory;
import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelHandlerContext;

import com.macine.bean.CustomerDetails;
import com.macine.bean.DataDetails;
import com.macine.bean.DataPackets;
import com.macine.bean.InvalidPacket;
import com.macine.bean.LatestData;
import com.macine.bean.MachineDetails;
import com.macine.bean.PacketDTO;
import com.macine.bean.ProtocolType;
import com.macine.util.HibernateUtil;

import util.ChannelBufferTools;
import util.Constants;
import util.Helper;
import util.Log;
import dm.BaseProtocolDecoder;
import dm.ServerManager;

public class SolarProtocolDecoder extends BaseProtocolDecoder {

	/**
	 * Initialize
	 */
	public SolarProtocolDecoder(ServerManager serverManager) {
		super(serverManager);
	}

	/**
	 * Decode regular message
	 */
	private Position decodeNormalMessage(ChannelBuffer buf, Channel channel)
			throws Exception {

		Position position = new Position();

		buf.readByte(); // header "<"
		buf.readByte(); // P/F

		Log.fineAndSysOut("****************************************");
		Log.fineAndSysOut(" Message Received(host/port): "
				+ channel.getLocalAddress().toString());
		Log.fineAndSysOut("****************************************");
		Hashtable<String, String> dataHashtable = ChannelBufferTools
				.readProtocol(buf);
		Log.fineAndSysOut("Data Received.." + dataHashtable.get("packets"));

		Session session = null;
		try {
			
			session = HibernateUtil.getSession();
			
			session.beginTransaction();
			DataPackets dataPackets = new DataPackets();
			dataPackets.setPacket(dataHashtable.get("packets"));
			dataPackets.setReceivedTimestamp(new Timestamp(Long
					.valueOf(dataHashtable.get(Constants.TIMESTAMP))));
			String imeiNo = dataHashtable.get(Constants.IMEI_NO);
			MachineDetails machineDetails = (MachineDetails) session.get(
					MachineDetails.class, imeiNo);
			Pattern pattern = Pattern.compile(".*[^0-9].*");
			System.out.println("Pattern matching checking...."+!pattern.matcher(imeiNo).matches());
			if(!pattern.matcher(imeiNo).matches()){
				if (machineDetails == null) {
					machineDetails = new MachineDetails();
					machineDetails.setImeiNo(imeiNo);
					CustomerDetails customerDetails = (CustomerDetails)session.get(CustomerDetails.class, (long)1);
					machineDetails.setCustomerDetails(customerDetails);
					machineDetails.setArea("NA");
					machineDetails.setCity("NA");
					machineDetails.setName("Solar "+imeiNo.substring(imeiNo.length()-6,imeiNo.length()));
					machineDetails.setCapacity(0.0);
					machineDetails.setType(0.0);
					machineDetails.setVarData(0.0);
					ProtocolType protocolType = (ProtocolType) session.get(ProtocolType.class, 1);
					machineDetails.setProtocolType(protocolType);
					session.save(machineDetails);
				}
				dataPackets.setMachineDetails(machineDetails);
				ChannelBufferTools.updateHistory(session, dataHashtable,
						machineDetails);
				List<LatestData> latestDataList = session
						.createCriteria(LatestData.class, "lData")
						.createAlias("lData.machineDetails", "mDetails")
						.add(Restrictions.eq("mDetails.imeiNo",
								dataHashtable.get(Constants.IMEI_NO))).list();
				System.out.println("latestData......" + latestDataList.size());
				for (LatestData latestData : latestDataList) {
					latestData.setDataTimestamp(new Timestamp(Long
							.valueOf(dataHashtable.get(Constants.TIMESTAMP))));
					System.out.println("Data..."+dataHashtable
							.get(latestData.getDataDetails().getDataId()));
					if(dataHashtable
							.get(latestData.getDataDetails().getDataId())!=null){
						latestData.setValue(Helper.getFormattedDoubleValue(dataHashtable
								.get(latestData.getDataDetails().getDataId())));
						latestData.setCurrentTimestamp(new Timestamp(System.currentTimeMillis()));
						session.update(latestData);
					}
				}
				session.save(dataPackets);
			}else{
				InvalidPacket invalidPacket = new InvalidPacket();
				invalidPacket.setData(dataHashtable.get("packets"));
				session.save(invalidPacket);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception......."+e.getMessage());
			e.printStackTrace();
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
		
		/*//byte[] response = {0x54, 0x68, 0x1A, 0x0D, 0x0A};
        
        byte[] idToResp = new byte[10];
        buf.getBytes(2, idToResp);
 
        ChannelBuffer sendBuf = HeapChannelBufferFactory.getInstance().getBuffer(18);
        sendBuf.writeByte('*');
        sendBuf.writeBytes(idToResp);
        sendBuf.writeByte(0x00);
        sendBuf.writeByte('#');

        channel.write(sendBuf);*/

		return position;
	}

	/**
	 * Decode message
	 */
	protected Object decode(ChannelHandlerContext ctx, Channel channel,
			Object msg) throws Exception {

		ChannelBuffer buf = (ChannelBuffer) msg;
		char first = (char) buf.getByte(0);

		// Check message type
		if (first == '*') {
			return decodeNormalMessage(buf, channel);
		}

		return null;
	}

}
