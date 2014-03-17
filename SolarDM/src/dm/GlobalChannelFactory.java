package dm;

import java.util.concurrent.Executors;

import org.jboss.netty.channel.ChannelFactory;
import org.jboss.netty.channel.socket.nio.NioServerSocketChannelFactory;

public class GlobalChannelFactory {
	 private static ChannelFactory instance = null;

	    private GlobalChannelFactory() {
	    }
	    
	    public static void release() {
	        if (instance != null) {
	            instance.releaseExternalResources();
	        }
	        instance = null;
	    }

	    public static ChannelFactory getFactory() {
	        if(instance == null) {
	            instance = new NioServerSocketChannelFactory(
	                Executors.newCachedThreadPool(),
	                Executors.newCachedThreadPool());
	        }
	        return instance;
	    }
}
