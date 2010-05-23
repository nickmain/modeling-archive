/**
 * Copyright (c) David N Main. All rights reserved.
 */
package anaphor.freemind;

import freemind.extensions.PermanentNodeHookAdapter;
import freemind.main.XMLElement;

/**
 * A node hook for running scripts at load time
 *
 * @author nickmain
 */
public class ClojureInitHook extends PermanentNodeHookAdapter {

    { ClojureRegistration.logger.info( "**** ClojureInitHook ****" ); }
    
    @Override
    public void loadFrom( XMLElement child ) {
        super.loadFrom( child );
        
        //defer to plugin registration time since the map isn't fully set up
        //until then and classpath hooks need to be processed first
        ClojureRegistration.enqueueForInit( getNode() );
    }    
}
