package dm;

import java.net.InetSocketAddress;
import java.nio.ByteOrder;
import java.nio.charset.Charset;

import org.jboss.netty.bootstrap.Bootstrap;
import org.jboss.netty.bootstrap.ConnectionlessBootstrap;
import org.jboss.netty.bootstrap.ServerBootstrap;
import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.buffer.ChannelBuffers;
import org.jboss.netty.buffer.HeapChannelBufferFactory;
import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelPipeline;
import org.jboss.netty.channel.ChannelPipelineFactory;
import org.jboss.netty.channel.SimpleChannelUpstreamHandler;
import org.jboss.netty.channel.group.ChannelGroup;
import org.jboss.netty.channel.group.ChannelGroupFuture;
import org.jboss.netty.channel.group.DefaultChannelGroup;

public abstract class DMServer {

	private ServerManager serverManager;
    private Bootstrap bootstrap;
    private String protocol;

    public String getProtocol() {
        return protocol;
    }    

    public DMServer(ServerManager serverManager, Bootstrap bootstrap, String protocol) {
        this.serverManager = serverManager;
        this.bootstrap = bootstrap;
        this.protocol = protocol;

        bootstrap.setFactory(GlobalChannelFactory.getFactory());

        address = serverManager.getProperties().getProperty(protocol + ".address");
        String portProperty = serverManager.getProperties().getProperty(protocol + ".port");
        port = (portProperty != null) ? Integer.valueOf(portProperty) : 5000;

        bootstrap.setPipelineFactory(new BasePipelineFactory(serverManager, this, protocol) {
            @Override
            protected void addSpecificHandlers(ChannelPipeline pipeline) {
            	DMServer.this.addSpecificHandlers(pipeline);
            }
        });
    }
    protected abstract void addSpecificHandlers(ChannelPipeline pipeline);
	
	/**
     * Server port
     */
    private Integer port;

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }

    /**
     * Server listening interface
     */
    private String address;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    /**
     * Set endianness
     */
    void setEndianness(ByteOrder byteOrder) {
        bootstrap.setOption("child.bufferFactory", new HeapChannelBufferFactory(byteOrder));
    }

    /**
     * Opened channels
     */
    private ChannelGroup allChannels = new DefaultChannelGroup();

    public ChannelGroup getChannelGroup() {
        return allChannels;
    }

    public void setPipelineFactory(ChannelPipelineFactory pipelineFactory) {
        bootstrap.setPipelineFactory(pipelineFactory);
    }
	/**
     * Start server
     */
    public void start() {
        InetSocketAddress endpoint;
        if (address == null) {
            endpoint = new InetSocketAddress(port);
        } else {
            endpoint = new InetSocketAddress(address, port);
        }

        Channel channel = null;
        if (bootstrap instanceof ServerBootstrap) {
            channel = ((ServerBootstrap) bootstrap).bind(endpoint);
        } else if (bootstrap instanceof ConnectionlessBootstrap) {
            channel = ((ConnectionlessBootstrap) bootstrap).bind(endpoint);
        }

        if (channel != null) {
            getChannelGroup().add(channel);
        }
    }
        
    /**
     * Stop server
     */
    public void stop() {
        ChannelGroupFuture future = getChannelGroup().close();
        future.awaitUninterruptibly();
    }

}
