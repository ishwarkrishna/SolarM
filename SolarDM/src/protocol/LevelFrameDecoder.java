package protocol;

import org.jboss.netty.buffer.ChannelBuffer;
import org.jboss.netty.channel.Channel;
import org.jboss.netty.channel.ChannelHandlerContext;
import org.jboss.netty.handler.codec.frame.FrameDecoder;

import util.ChannelBufferTools;

public class LevelFrameDecoder extends FrameDecoder {

	protected Object decode(
            ChannelHandlerContext ctx,
            Channel channel,
            ChannelBuffer buf) throws Exception {

        int length = buf.readableBytes();
        
        System.out.println("FrameDecoder length...................."+length);
        // Find start
        Integer beginIndex = ChannelBufferTools.find(buf, 0, length, "<");
        if (beginIndex == null) {
            return null;
        }

        Integer endIndex = ChannelBufferTools.find(buf, beginIndex, length, ";");
        if (endIndex == null) {
            return null;
        }
        if ((endIndex-beginIndex)!=83){
 			System.out.println("Length of the data string is not valied :"+(endIndex-beginIndex));
 			System.out.println("In-valied message");
 			buf.readBytes(length);
 			return null;
 		}
        ChannelBuffer frame = buf.readBytes(endIndex - beginIndex + 1);
        
        return frame;

    }
}
