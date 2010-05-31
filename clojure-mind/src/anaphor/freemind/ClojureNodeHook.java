/**
 * Copyright (c) David N Main. All rights reserved.
 */
package anaphor.freemind;

import java.awt.Color;

import clojure.lang.IFn;
import freemind.extensions.PermanentNodeHookAdapter;
import freemind.main.XMLElement;
import freemind.modes.MindIcon;
import freemind.modes.MindMapNode;

/**
 * A node hook for attaching Clojure to a node
 *
 * @author nickmain
 */
public class ClojureNodeHook extends PermanentNodeHookAdapter {

    { ClojureRegistration.logger.info( "**** ClojureNodeHook **** " + hashCode() ); }

    private static final String ERROR_PREFIX = "ERROR: ";
    private static final String LOAD_FN = "load-hook-script";
    
    private IFn hookFunction;
    private String scriptSource = "anaphor.freemind.clojuremind/node-hook";
    
    /**
     * Set an error message on the node
     */
    private void setError( String message ) {
        MindMapNode node = getNode();
        node.setText( ERROR_PREFIX + message );
        node.setStateIcon( "error", MindIcon.factory( "messagebox_warning" ).getIcon() );
        node.setColor( Color.red );
        getController().nodeRefresh( node );
    }
    
    /**
     * Call the clojure hook function
     * 
     * @param onlyIfChanged if true then only call if the script has changed
     */
    private void callClojure( MindMapNode changedNode, MindMapNode parentNode, boolean isAdd ) {
        
        MindMapNode node = getNode();

        //if text indicates error then do nothing to avoid looping
        String text = node.getPlainTextContent();
        if( text != null && text.startsWith( ERROR_PREFIX ) ) return;
        
        //reload script if changed
        if( hookFunction == null ) {

            try {
                Object fn = ClojureRegistration.callClojure( 
                                ClojureRegistration.CLOJURE_NS, LOAD_FN, 
                                scriptSource );
    
                if( fn == null ) {
                    setError( "Hook script must return a function (got null/nil)" );
                    return;
                }
                
                if( fn instanceof IFn ) {
                    hookFunction = (IFn) fn;
                }
                else {
                    setError( "Hook script must return a function (got " + fn.getClass().getSimpleName() + ")" );
                    return;
                }
            }
            catch( Exception e ) {
                setError( e.getMessage() );
                return;
            }
        }    
        
        try {
            ClojureRegistration.callClojure( hookFunction, node, changedNode, parentNode, isAdd );
        }
        catch( Exception e ) {
            setError( e.getMessage() );
        }
    }
        
    /**
     * @see freemind.extensions.PermanentNodeHookAdapter#onAddChild(freemind.modes.MindMapNode)
     */
    @Override
    public void onAddChild( MindMapNode newChildNode ) {
        //nothing - onAddChildren suffices
    }

    /**
     * @see freemind.extensions.PermanentNodeHookAdapter#onAddChildren(freemind.modes.MindMapNode)
     */
    @Override
    public void onAddChildren( MindMapNode addedChild ) {
        callClojure( addedChild, null, true );
    }

    /**
     * @see freemind.extensions.PermanentNodeHookAdapter#onNewChild(freemind.modes.MindMapNode)
     */
    @Override
    public void onNewChild( MindMapNode newChildNode ) {
        //nothing - onAddChildren suffices
    }

    /**
     * @see freemind.extensions.PermanentNodeHookAdapter#onRemoveChild(freemind.modes.MindMapNode)
     */
    @Override
    public void onRemoveChild( MindMapNode oldChildNode ) {
        //nothing - this method does not appear to be called
    }

    /**
     * @see freemind.extensions.PermanentNodeHookAdapter#onRemoveChildren(freemind.modes.MindMapNode, freemind.modes.MindMapNode)
     */
    @Override
    public void onRemoveChildren( MindMapNode oldChildNode, MindMapNode oldDad ) {
        callClojure( oldChildNode, oldDad, false );
    }

    /** @see freemind.extensions.PermanentNodeHookAdapter#onUpdateChildrenHook(freemind.modes.MindMapNode) */
    @Override
    public void onUpdateChildrenHook( MindMapNode updatedNode ) {
        callClojure( updatedNode, null, false );
    }


    /** @see freemind.extensions.PermanentNodeHookAdapter#onUpdateNodeHook() */
    @Override
    public void onUpdateNodeHook() {
        callClojure( getNode(), null, false );
    }

    /** @see freemind.extensions.PermanentNodeHookAdapter#loadFrom(freemind.main.XMLElement) */
    @Override
    public void loadFrom( XMLElement child ) {
        super.loadFrom( child );
        scriptSource = child.getContent().trim();
    }

    /** @see freemind.extensions.PermanentNodeHookAdapter#save(freemind.main.XMLElement) */
    @Override
    public void save( XMLElement xml ) {
        super.save( xml );
        xml.setContent( scriptSource );
    }
}
