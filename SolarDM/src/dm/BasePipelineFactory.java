package dm;

import java.net.InetSocketAddress;

import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.buffer.ChannelBuffers;
import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelEvent;
import org.jboss.netty.channel.ChannelFuture;
import org.jboss.netty.channel.ChannelFutureListener;
import org.jboss.netty.channel.ChannelHandlerContext;
import org.jboss.netty.channel.ChannelPipeline;
import org.jboss.netty.channel.ChannelPipelineFactory;
import org.jboss.netty.channel.ChannelStateEvent;
import org.jboss.netty.channel.Channels;
import org.jboss.netty.channel.ExceptionEvent;
import org.jboss.netty.channel.MessageEvent;
import org.jboss.netty.channel.SimpleChannelHandler;
import org.jboss.netty.handler.logging.LoggingHandler;
import org.jboss.netty.handler.timeout.IdleStateHandler;

//import org.traccar.ReverseGeocoderHandler;
//import org.traccar.TrackerEventHandler;
//import org.traccar.BasePipelineFactory.OpenChannelHandler;
//import org.traccar.BasePipelineFactory.StandardLoggingHandler;
//import org.traccar.geocode.ReverseGeocoder;
import util.Log;
//import org.traccar.model.DataManager;

public abstract class BasePipelineFactory implements ChannelPipelineFactory {

	private DMServer server;
    //private DataManager dataManager;
    private Boolean loggerEnabled;
    private Integer resetDelay;
    //private ReverseGeocoder reverseGeocoder;

    /**
     * Open channel handler
     */
    protected class OpenChannelHandler extends SimpleChannelHandler {

        private DMServer server;

        public OpenChannelHandler(DMServer server) {
            this.server = server;
        }

        @Override
        public void channelOpen(ChannelHandlerContext ctx, ChannelStateEvent e) {        	
            server.getChannelGroup().add(e.getChannel());
        }
        
        /*@Override
    	public void messageReceived(ChannelHandlerContext ctx, MessageEvent e) {
    		// Send back the received message to the remote peer.    		
    		Channel c = e.getChannel();    		
    		System.out.println("Server: "+ (e.getMessage()).toString());
    		c.write(e.getMessage());    	    	
    	}*/
    }

    /**
     * Logging using global logger
     */
    protected class StandardLoggingHandler extends LoggingHandler {

        static final String HEX_CHARS = "0123456789ABCDEF";

        @Override
        public void log(ChannelEvent e) {
            if (e instanceof MessageEvent) {
                MessageEvent event = (MessageEvent) e;
                StringBuilder msg = new StringBuilder();

                //msg.append("[").append(((InetSocketAddress) e.getChannel().getLocalAddress()).getPort()).append(" - ");
                //msg.append(((InetSocketAddress) event.getRemoteAddress()).getAddress().getHostAddress()).append("]");

                // Append hex message
                if (event.getMessage() instanceof ChannelBuffer) {
                    msg.append("(HEX: ");
                    msg.append(ChannelBuffers.hexDump((ChannelBuffer) event.getMessage()));
                    msg.append(")");
                }

                Log.fine(msg.toString());
            } else if (e instanceof ExceptionEvent) {
                ExceptionEvent event = (ExceptionEvent) e;
                Log.warning(event.getCause().toString());
            }
            // TODO: handle other events
        }
    }

    public BasePipelineFactory(ServerManager serverManager, DMServer server, String protocol) {
        this.server = server;
        //dataManager = serverManager.getDataManager();
        loggerEnabled = serverManager.isLoggerEnabled();
        //reverseGeocoder = serverManager.getReverseGeocoder();

        String resetDelayProperty = serverManager.getProperties().getProperty(protocol + ".resetDelay");
        if (resetDelayProperty != null) {
            resetDelay = Integer.valueOf(resetDelayProperty);
        }
    }

    /*protected DataManager getDataManager() {
        return dataManager;
    }*/

    protected abstract void addSpecificHandlers(ChannelPipeline pipeline);

   // @Override
    public ChannelPipeline getPipeline() {
        ChannelPipeline pipeline = Channels.pipeline();
        if (resetDelay != null) {
            pipeline.addLast("idleHandler", new IdleStateHandler(GlobalTimer.getTimer(), resetDelay, 0, 0));
        }
        pipeline.addLast("openHandler", new OpenChannelHandler(server));
        if (loggerEnabled) {
            pipeline.addLast("logger", new StandardLoggingHandler());
        }
        addSpecificHandlers(pipeline);
       /* if (reverseGeocoder != null) {
            pipeline.addLast("geocoder", new ReverseGeocoderHandler(reverseGeocoder));
        }
        pipeline.addLast("handler", new TrackerEventHandler(dataManager));*/
        return pipeline;
    }

}
