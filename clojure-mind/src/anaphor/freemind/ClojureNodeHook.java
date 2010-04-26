/**
 * Copyright (c) David N Main. All rights reserved.
 */
package anaphor.freemind;

import clojure.lang.RT;
import freemind.extensions.PermanentNodeHookAdapter;
import freemind.modes.MindMapNode;

/**
 * A node hook for attaching Clojure to a node
 *
 * @author nickmain
 */
public class ClojureNodeHook extends PermanentNodeHookAdapter {

    { ClojureRegistration.logger.info( "**** ClojureRootNodeHook ****" ); }
    
    /** @see freemind.extensions.PermanentNodeHookAdapter#onUpdateChildrenHook(freemind.modes.MindMapNode) */
    @Override
    public void onUpdateChildrenHook( MindMapNode updatedNode ) {
        ClojureRegistration.logger.info( "**** onUpdateChildrenHook ****" );
        
        Thread.currentThread().setContextClassLoader( clojure.main.class.getClassLoader() );
        try {
//            RT.var( "anaphor.freemind.clojuremind", "on-update-descendant" )
//              .invoke( getController(), getNode(), updatedNode );
        }
        catch( Exception e ) {
            ClojureRegistration.logger.warning( "Clojure Exception: " + e.getMessage() );
        }
    }

    /** @see freemind.extensions.PermanentNodeHookAdapter#onUpdateNodeHook() */
    @Override
    public void onUpdateNodeHook() {
        ClojureRegistration.logger.info( "**** onUpdateNodeHook ****" );

        Thread.currentThread().setContextClassLoader( clojure.main.class.getClassLoader() );
        try {
//            RT.var( "anaphor.freemind.clojuremind", "on-update-node" ).invoke( getController(), getNode() );
        }
        catch( Exception e ) {
            ClojureRegistration.logger.warning( "Clojure Exception: " + e.getMessage() );
        }
    }
}
