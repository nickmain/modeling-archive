/**
 * Copyright (c) David N Main. All rights reserved.
 */
package anaphor.freemind;

import clojure.lang.Var;
import freemind.extensions.PermanentNodeHookAdapter;
import freemind.main.XMLElement;
import freemind.modes.MindMapNode;

/**
 * A node hook for attaching Clojure to a node
 *
 * @author nickmain
 */
public class ClojureNodeHook extends PermanentNodeHookAdapter {

    { ClojureRegistration.logger.info( "**** ClojureNodeHook **** " + hashCode() ); }
    
    private static final String NAMESPACE_ATTR = "cljns";
    private static final String FN_NAME_ATTR = "cljfn";
    private static final String DEFAULT_HOOK_FN = "node-hook";
    
    private String namespace = ClojureRegistration.CLOJURE_NS;
    private String funcName  = DEFAULT_HOOK_FN;
    
    /**
     * Call the clojure hook function
     */
    private void callClojure( MindMapNode changeNode, MindMapNode parent, boolean isAdd ) {
        Var fn = ClojureRegistration.getVar( namespace, funcName );
        if( fn == null ) {
            logger.warning( "Hook function not found: " + namespace + "/" + funcName );
            return;
        }
        
        try {
            fn.invoke( getNode(), changeNode, parent, isAdd );
        }
        catch( Exception e ) {            
            logger.severe( "While calling node hook " + namespace + "/" + funcName + " : " + e );
            e.printStackTrace();
        }
    }
    
    /**
     * @see freemind.extensions.PermanentNodeHookAdapter#loadFrom(freemind.main.XMLElement)
     */
    @Override
    public void loadFrom( XMLElement xml ) {
        super.loadFrom( xml );

        namespace = xml.getStringAttribute( NAMESPACE_ATTR, ClojureRegistration.CLOJURE_NS );
        funcName  = xml.getStringAttribute( FN_NAME_ATTR, DEFAULT_HOOK_FN );
    }

    /**
     * @see freemind.extensions.PermanentNodeHookAdapter#save(freemind.main.XMLElement)
     */
    @Override
    public void save( XMLElement xml ) {
        super.save( xml );
        
        xml.setAttribute( NAMESPACE_ATTR, namespace );
        xml.setAttribute( FN_NAME_ATTR, funcName );
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
        String text = getNode().getText();
        if( text.equals( "=/" ) ) {
            namespace = ClojureRegistration.CLOJURE_NS;
            funcName = DEFAULT_HOOK_FN;
            getNode().setNoteText( "" );
            getNode().setText( "HOOK RESET" );
            getController().nodeRefresh( getNode() );
            return;
        }
        
        if( text.startsWith( "=" ) ) {
            text = text.substring( 1 );
            
            int slash = text.indexOf( "/" );
            if( slash > 0 ) {
                namespace = text.substring( 0, slash );
                funcName  = text.substring( slash + 1 );

                if( namespace.length() > 0 && funcName.length() > 0 ) {
                    getNode().setNoteText( "Clojure hook:\n namespace=" + namespace + "\n name=" + funcName );
                    getNode().setText( "HOOK SET" );
                    getController().nodeRefresh( getNode() );
                    return;
                }
            }
            
            namespace = ClojureRegistration.CLOJURE_NS;
            funcName = DEFAULT_HOOK_FN;
            getNode().setNoteText( "" );
            getNode().setText( "ERROR: use namespace/fn-name | HOOK RESET" );
            getController().nodeRefresh( getNode() );
            return;
        }
        
        callClojure( getNode(), null, false );
    }
}
