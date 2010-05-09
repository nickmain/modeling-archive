/**
 * Copyright (c) David N Main. All rights reserved.
 */
package anaphor.freemind;

import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.net.URL;
import java.util.List;

import freemind.extensions.PermanentNodeHookAdapter;
import freemind.main.XMLElement;
import freemind.modes.MindIcon;
import freemind.modes.MindMap;
import freemind.modes.MindMapNode;
import freemind.modes.mindmapmode.MindMapController;

/**
 * A node hook for adding to the classpath used by Clojure
 *
 * @author nickmain
 */
public class ClojureClassPathHook extends PermanentNodeHookAdapter {

    { ClojureRegistration.logger.info( "**** ClojureClassPathHook ****" ); }
    
    @Override
    public void loadFrom( XMLElement xml ) {
        super.loadFrom( xml );
        ClojureRegistration.enqueueForClasspath( getNode() );        
    }
    
    @Override
    public void onNewChild( MindMapNode newChildNode ) {
        super.onNewChild( newChildNode );
        processChild( newChildNode );
    }

    @Override
    public void onUpdateChildrenHook( MindMapNode updatedNode ) {
        super.onUpdateChildrenHook( updatedNode );
        
        if( updatedNode.getParentNode() == getNode() ) processChild( updatedNode );
    }

    /**
     * If child points to a file then add it to the classpath
     */
    private void processChild( MindMapNode child ) {
        ClojureRegistration.logger.info( "**** processChild **** " + child );

        String link = child.getLink();
        if( link != null && link.trim().length() > 0 ) {
            addURL( link, child );
        }
    }

    /**
     * Add a link URL
     */
    private static void addURL( String link, MindMapNode child ) {
        MindMap map = child.getMap();
        File mapDir = map.getFile().getParentFile();

        try {
            File cpFile = new File( mapDir, link );
            if( ! cpFile.exists() ) throw new FileNotFoundException( cpFile.getAbsolutePath() );

            URL url = cpFile.toURI().toURL();
            ClojureRegistration.logger.info( "Adding to classpath: " + url );
            ClojureRegistration.addClassPathURL( url );
        }
        catch( Exception e ) {
            e.printStackTrace();
            
            MindMapController controller = (MindMapController) child.getMap().getModeController();
            MindMapNode errNode = controller.addNewNode( child, 0, child.isLeft() );
            errNode.setText( e.toString() );
            errNode.setStateIcon( "error", MindIcon.factory( "messagebox_warning" ).getIcon() );
            errNode.setColor( Color.red );
            controller.nodeRefresh( errNode );
        }        
    }
    
    /**
     * Call back from ClojureRegistration - needed since the map's file is
     * not set until after it is fully loaded (the invoke() call is even too
     * early)
     */
    @SuppressWarnings("unchecked")
    /*pkg*/ static void processNode( MindMapNode node ) {
        
        for( MindMapNode child : (List<MindMapNode>) node.getChildren() ) {            
            String link = child.getLink();            
            addURL( link, child );
        }
    }
}
