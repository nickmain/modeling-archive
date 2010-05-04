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
        ClojureRegistration.enqueueForInit( getNode() );
    }
}
