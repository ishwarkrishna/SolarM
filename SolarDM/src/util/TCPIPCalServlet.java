package util;
import java.sql.SQLException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.management.OperatingSystemMXBean;
import java.lang.management.RuntimeMXBean;
import java.util.Locale;

import dm.ServerManager;

// Extend HttpServlet class
public class TCPIPCalServlet extends HttpServlet {
 
  public void init() throws ServletException
  {
	  Locale.setDefault(Locale.ENGLISH);

      final ServerManager service = new ServerManager();
      try {
		service.init(null);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      System.out.println("**************************************************************************");
      System.out.println("                   M2M Platform - Device Manager                             ");
      System.out.println("**************************************************************************");
      System.out.println("Starting server...");
      printSystemInfo();

      service.start();

      // Shutdown server properly
      Runtime.getRuntime().addShutdownHook(new Thread() {
          @Override
          public void run() {
              System.out.println("Shutting down server...");
              service.stop();
          }
      });
     
  }
 
  private static void printSystemInfo() {
      try {
          OperatingSystemMXBean operatingSystemBean = ManagementFactory.getOperatingSystemMXBean();
          /*System.out.println("Operating System" +
              " name: " + operatingSystemBean.getName() +
              " version: " + operatingSystemBean.getVersion() +
              " architecture: " + operatingSystemBean.getArch());*/

          RuntimeMXBean runtimeBean = ManagementFactory.getRuntimeMXBean();
          /*System.out.println("Java Runtime" +
              " name: " + runtimeBean.getVmName() +
              " vendor: " + runtimeBean.getVmVendor() +
              " version: " + runtimeBean.getVmVersion());*/

          MemoryMXBean memoryBean = ManagementFactory.getMemoryMXBean();
          /*System.out.println("Memory Limit" +
              " heap: " + memoryBean.getHeapMemoryUsage().getMax() / (1024 * 1024) + "mb" +
              " non-heap: " + memoryBean.getNonHeapMemoryUsage().getMax() / (1024 * 1024) + "mb");*/
      } catch (Exception e) {
          Log.warning("Failed to get system info");
      }
  }
  public void destroy()
  {
      // do nothing.
  }
}