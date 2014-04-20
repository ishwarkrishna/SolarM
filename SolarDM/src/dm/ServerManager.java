package dm;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.logging.FileHandler;
import java.util.logging.Formatter;
import java.util.logging.LogRecord;

import org.jboss.netty.bootstrap.ServerBootstrap;
import org.jboss.netty.channel.ChannelPipeline;

import protocol.SolarFrameDecoder;
import protocol.SolarFrameDecoder1;
import protocol.LevelFrameDecoder;
import protocol.SolarFrameDecoder2;
import protocol.SolarProtocolDecoder;
import protocol.SolarProtocolDecoder1;
import protocol.LevelProtocolDecoder;
import protocol.SolarProtocolDecoder2;
import protocol.UPSFrameDecoder;
import protocol.UPSProtocolDecoder;
import util.Log;

public class ServerManager {

	 private final List<DMServer> serverList = new LinkedList<DMServer>();

	    public void addDMServer(DMServer DMServer) {
	        serverList.add(DMServer);
	    }

	    private boolean loggerEnabled;

	    public boolean isLoggerEnabled() {
	        return loggerEnabled;
	    }

	   /* private DataManager dataManager;

	    public DataManager getDataManager() {
	        return dataManager;
	    }

	    private ReverseGeocoder reverseGeocoder;

	    public ReverseGeocoder getReverseGeocoder() {
	        return reverseGeocoder;
	    }*/

	    /*private WebServer webServer;

	    public WebServer getWebServer() {
	        return webServer;
	    }*/

	    private Properties properties;

	    public Properties getProperties() {
	        return  properties;
	    }

	    /**
	     * Initialize
	     */
	    public void init(String[] arguments)
	            throws IOException, ClassNotFoundException, SQLException {
	        // Load properties
	        properties = new Properties();
        	FileInputStream fileInput = null;
        	//fileInput = new FileInputStream("../ext/config.properties");
        	fileInput = new FileInputStream("ext/config.properties");
			properties.load(fileInput);	        	

			//dataManager = new DatabaseDataManager(properties);

	        initLogger(properties);
	        initUPSServer("ups");	 
	        initSolarServer("solar");
	        initSolarServer1("solar1");
	        initLevelServer("level");
	        initSolarServer2("solar2");
	    }

	    /**
	     * Start
	     */
	    public void start() {	        
	        for (Object server: serverList) {
	        	DMServer srvr = (DMServer) server;
	            srvr.start();
	            System.out.println("Application '"+ srvr.getProtocol()+"' started in port '"+ srvr.getPort()+ "'");
	        }	        	        
	    }	    

	    /**
	     * Stop
	     */
	    public void stop() {
	        for (Object server: serverList) {
	            ((DMServer) server).stop();
	        }

	        // Release resources
	        GlobalChannelFactory.release();
	        GlobalTimer.release();	        
	    }

	    /**
	     * Destroy
	     */
	    public void destroy() {
	        serverList.clear();
	    }

	    /**
	     * Initialize logger
	     */
	    private void initLogger(Properties properties) throws IOException {

	        //loggerEnabled = Boolean.valueOf(properties.getProperty("logger.enable"));
	    	loggerEnabled = true;
	        if (loggerEnabled) {

	            String fileName = properties.getProperty("logger.file");        
	            if (fileName != null) {

	                FileHandler file = new FileHandler(fileName, true);

	                // Simple formatter
	                file.setFormatter(new Formatter() {
	                    private final String LINE_SEPARATOR =
	                            System.getProperty("line.separator", "\n");

	                    private final DateFormat dateFormat =
	                            new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	                    @Override
	                    public String format(LogRecord record) {
	                        StringBuffer line = new StringBuffer();
	                        dateFormat.format(new Date(record.getMillis()), line, new FieldPosition(0));
	                        //line.append(" ");
	                        //line.append(record.getSourceClassName());
	                        //line.append(".");
	                        //line.append(record.getSourceMethodName());
	                        //line.append(" ");
	                        //line.append(record.getLevel().getName());
	                        line.append(": ");
	                        line.append(formatMessage(record));
	                        line.append(LINE_SEPARATOR);
	                        return line.toString();
	                    }
	                });

	                Log.getLogger().addHandler(file);
	            }
	        }
	    }	    

	    private boolean isProtocolEnabled(Properties properties, String protocol) {
	        String enabled = properties.getProperty(protocol + ".enable");
	        if (enabled != null) {
	            return Boolean.valueOf(enabled);
	        }
	        return false;
	    }	    
	    
	    private void initUPSServer(String protocol) throws SQLException {
	        if (isProtocolEnabled(properties, protocol)) {
	            serverList.add(new DMServer(this, new ServerBootstrap(), protocol) {
	                @Override
	                protected void addSpecificHandlers(ChannelPipeline pipeline) {
	                    pipeline.addLast("frameDecoder", new UPSFrameDecoder());	                    	                   
	                    pipeline.addLast("objectDecoder", new UPSProtocolDecoder(ServerManager.this));
	                }
	            });
	        }
	    }
	    
	    private void initSolarServer(String protocol) throws SQLException {
	        if (isProtocolEnabled(properties, protocol)) {
	            serverList.add(new DMServer(this, new ServerBootstrap(), protocol) {
	                @Override
	                protected void addSpecificHandlers(ChannelPipeline pipeline) {
	                    pipeline.addLast("frameDecoder", new SolarFrameDecoder());	                    	                   
	                    pipeline.addLast("objectDecoder", new SolarProtocolDecoder(ServerManager.this));
	                }
	            });
	        }
	    }
	    
	    private void initSolarServer1(String protocol) throws SQLException {
	        if (isProtocolEnabled(properties, protocol)) {
	            serverList.add(new DMServer(this, new ServerBootstrap(), protocol) {
	                @Override
	                protected void addSpecificHandlers(ChannelPipeline pipeline) {
	                    pipeline.addLast("frameDecoder", new SolarFrameDecoder1());	                    	                   
	                    pipeline.addLast("objectDecoder", new SolarProtocolDecoder1(ServerManager.this));
	                }
	            });
	        }
	    }
	    
	    private void initLevelServer(String protocol) throws SQLException {
	        if (isProtocolEnabled(properties, protocol)) {
	            serverList.add(new DMServer(this, new ServerBootstrap(), protocol) {
	                @Override
	                protected void addSpecificHandlers(ChannelPipeline pipeline) {
	                    pipeline.addLast("frameDecoder", new LevelFrameDecoder());	                    	                   
	                    pipeline.addLast("objectDecoder", new LevelProtocolDecoder(ServerManager.this));
	                }
	            });
	        }
	    }
	    
	    private void initSolarServer2(String protocol) throws SQLException {
	    	 if (isProtocolEnabled(properties, protocol)) {
	        	 serverList.add(new DMServer(this, new ServerBootstrap(), protocol) {
	                @Override
	                protected void addSpecificHandlers(ChannelPipeline pipeline) {
	                    pipeline.addLast("frameDecoder", new SolarFrameDecoder2());	                    	                   
	                    pipeline.addLast("objectDecoder", new SolarProtocolDecoder2(ServerManager.this));
	                }
	            });
	        }
	    }
}
