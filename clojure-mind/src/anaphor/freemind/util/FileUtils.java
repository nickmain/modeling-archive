/**
 * Copyright (c) David N Main. All rights reserved.
 */
package anaphor.freemind.util;

import java.io.*;

/**
 * File utilities
 *
 * @author nickmain
 */
public class FileUtils {

    /**
     * Read file contents as a string
     * @throws IOException 
     */
    public static String readFile( File file ) throws IOException {
        StringWriter s = new StringWriter();
        char[] buff = new char[1000];
        
        FileReader in = new FileReader( file );
        try {
            int read = 0;
            while((read = in.read( buff )) >= 0 ) {
                s.write( buff,  0, read );
            }
        } 
        finally {
            in.close();
        }
        
        return s.toString();
    }
}
