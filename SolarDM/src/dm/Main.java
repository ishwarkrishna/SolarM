package dm;

import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.management.OperatingSystemMXBean;
import java.lang.management.RuntimeMXBean;
import java.util.Locale;

import util.Log;

public class Main {
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

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Locale.setDefault(Locale.ENGLISH);

        final ServerManager service = new ServerManager();
        service.init(args);
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

}
