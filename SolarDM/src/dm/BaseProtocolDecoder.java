package dm;

import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelHandlerContext;
import org.jboss.netty.handler.codec.oneone.OneToOneDecoder;

public class BaseProtocolDecoder extends OneToOneDecoder {
	private ServerManager serverManager;
//    private DataManager dataManager;
//
//    public final void setDataManager(DataManager dataManager) {
//        this.dataManager = dataManager;
//    }
//
//    public final DataManager getDataManager() {
//        return dataManager;
//    }

    public final void setServerManager(ServerManager serverManager) {
        this.serverManager = serverManager;
    }

    public final ServerManager getServerManager() {
        return serverManager;
    }

    public BaseProtocolDecoder() {
    }

    public BaseProtocolDecoder(ServerManager serverManager) {
        if (serverManager != null) {
            this.serverManager = serverManager;
            //dataManager = serverManager.getDataManager();
        }
    }

	@Override
	protected Object decode(ChannelHandlerContext arg0, Channel arg1,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
