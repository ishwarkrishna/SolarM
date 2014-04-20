package protocol;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.regex.Pattern;

import model.Position;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelHandlerContext;

import util.ChannelBufferTools;
import util.Constants;
import util.Helper;
import util.Log;

import com.macine.bean.CustomerDetails;
import com.macine.bean.DataPackets;
import com.macine.bean.InvalidPacket;
import com.macine.bean.LatestData;
import com.macine.bean.MachineDetails;
import com.macine.bean.ProtocolType;
import com.macine.util.HibernateUtil;

import dm.BaseProtocolDecoder;
import dm.ServerManager;

public class SolarProtocolDecoder2 extends BaseProtocolDecoder {

	/**
	 * Initialize
	 */
	public SolarProtocolDecoder2(ServerManager serverManager) {
		super(serverManager);
	}

	/**
	 * Decode regular message
	 * Solar phase 3 protocol
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
				.readProtocol2(buf);
		
		Session session = null;
		try {
			session = HibernateUtil.getSession();
			session.beginTransaction();
			DataPackets dataPackets = new DataPackets();
			dataPackets.setPacket(dataHashtable.get("packets"));
			// System.out.println(dataHashtable.toString());
			dataPackets.setReceivedTimestamp(new Timestamp(Long
					.valueOf(dataHashtable.get(Constants.TIMESTAMP))));
			String imeiNo = dataHashtable.get(Constants.IMEI_NO);
			MachineDetails machineDetails = (MachineDetails) session.get(
					MachineDetails.class, imeiNo);
			Pattern pattern = Pattern.compile(".*[^0-9].*");
			System.out.println("Pattern matching checking...."
					+ !pattern.matcher(imeiNo).matches());
			if (!pattern.matcher(imeiNo).matches()) {
				if (machineDetails == null) {
					machineDetails = new MachineDetails();
					machineDetails.setImeiNo(imeiNo);
					CustomerDetails customerDetails = (CustomerDetails) session
							.get(CustomerDetails.class, (long) 1);
					machineDetails.setCustomerDetails(customerDetails);
					machineDetails.setArea("NA");
					machineDetails.setCity("NA");
					machineDetails.setName("SolarIII "
							+ imeiNo.substring(imeiNo.length() - 6,
									imeiNo.length()));
					machineDetails.setCapacity(0.0);
					machineDetails.setType(0.0);
					machineDetails.setVarData(0.0);
					ProtocolType protocolType = (ProtocolType) session.get(
							ProtocolType.class, 4);
					machineDetails.setProtocolType(protocolType);
					session.save(machineDetails);
				}
				dataPackets.setMachineDetails(machineDetails);
				session.save(dataPackets);
				List<LatestData> latestDataList = session
						.createCriteria(LatestData.class, "lData")
						.createAlias("lData.machineDetails", "mDetails")
						.add(Restrictions.eq("mDetails.imeiNo",
								dataHashtable.get(Constants.IMEI_NO))).list();
				List<String> conditionCheckingList = new ArrayList<String>();
				//conditionCheckingList.add(Constants.DATA11);
				//conditionCheckingList.add(Constants.DATA12);
				//conditionCheckingList.add(Constants.DATA13);
				double divideBy = 1000.0;
				double deviceValue = 0.0;
				double calValue = 0.0;
				for (LatestData latestData : latestDataList) {
					latestData.setDataTimestamp(new Timestamp(Long
							.valueOf(dataHashtable.get(Constants.TIMESTAMP))));
					if (dataHashtable.get(latestData.getDataDetails()
							.getDataId()) != null) {
						deviceValue = Helper
								.getFormattedDoubleValue(dataHashtable
										.get(latestData.getDataDetails()
												.getDataId()));
						if (conditionCheckingList.contains(latestData
								.getDataDetails().getDataId())) {
							calValue = deviceValue / divideBy;
							if (deviceValue <= 0) {
								
								dataHashtable.put(latestData.getDataDetails()
										.getDataId(), latestData.getValue()
										+ "");
							} else {
								latestData.setValue(calValue);
								dataHashtable.put(latestData.getDataDetails()
										.getDataId(), calValue + "");
							}
						} else {
							latestData.setValue(Helper
									.getFormattedDoubleValue(dataHashtable
											.get(latestData.getDataDetails()
													.getDataId())));
						}

						latestData.setCurrentTimestamp(new Timestamp(System
								.currentTimeMillis()));
						session.update(latestData);
					}
				}
				ChannelBufferTools.updateHistoryForProtocol3(session,
						dataHashtable, machineDetails);
			} else {
				InvalidPacket invalidPacket = new InvalidPacket();
				invalidPacket.setData(dataHashtable.get("packets"));
				session.save(invalidPacket);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("Exception in "+e);
			e.printStackTrace();
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}

		/*
		 * //byte[] response = {0x54, 0x68, 0x1A, 0x0D, 0x0A};
		 * 
		 * byte[] idToResp = new byte[10]; buf.getBytes(2, idToResp);
		 * 
		 * ChannelBuffer sendBuf =
		 * HeapChannelBufferFactory.getInstance().getBuffer(18);
		 * sendBuf.writeByte('*'); sendBuf.writeBytes(idToResp);
		 * sendBuf.writeByte(0x00); sendBuf.writeByte('#');
		 * 
		 * channel.write(sendBuf);
		 */

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
