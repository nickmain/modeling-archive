/**
 * Copyright (c) David N Main. All rights reserved.
 */
package anaphor.freemind;

import java.awt.Color;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.*;
import java.util.logging.Logger;

import javax.swing.event.TreeModelEvent;
import javax.swing.event.TreeModelListener;

import clojure.lang.RT;
import clojure.lang.Var;
import freemind.extensions.HookRegistration;
import freemind.extensions.NodeHook;
import freemind.modes.MindIcon;
import freemind.modes.MindMap;
import freemind.modes.MindMapNode;
import freemind.modes.ModeController;
import freemind.modes.mindmapmode.MindMapController;
import freemind.modes.mindmapmode.MindMapNodeModel;

/**
 * Plugin Registration. Referenced by plugin XML config.
 * 
 * Adds a listener to the mindmap model that passes events to the Clojure
 * handler. 
 *
 * @author nickmain
 */
public class ClojureRegistration implements HookRegistration {

    static final Logger logger = Logger.getLogger( "Clojure" );
    
    /**
     * URLClassLoader that exposes the addURL method
     */
    public static class ClojureURLClassLoader extends URLClassLoader {
        public ClojureURLClassLoader() {
            super( new URL[0], ClojureRegistration.class.getClassLoader() );
        }

        @Override
        public void addURL( URL url ) {
            super.addURL( url );
        }
    }
    
    private static final ClojureURLClassLoader baseLoader = new ClojureURLClassLoader();
    private static final Collection<URL> knownURLs = new HashSet<URL>();
    
    //namespace of the Clojure-side logic
    public static final String CLOJURE_NS = "anaphor.freemind.clojuremind";
    
    //load the clojure code
    static {
        try {         
            logger.info( "Loading Clojure boot script.." );
            Thread.currentThread().setContextClassLoader( baseLoader );
            clojure.main.main( new String[] { "@/anaphor/freemind/clojuremind.clj" } );
        }
        catch( Exception e ) {
            e.printStackTrace();            
        }        
    }
    
    //initialization queue
    private static LinkedList<MindMapNode> initQueue = new LinkedList<MindMapNode>();
    
    //classpath queue
    private static LinkedList<MindMapNode> classpathQueue = new LinkedList<MindMapNode>();
    
    private final MindMapController controller;
    private TreeModelListener listener;
    
    public ClojureRegistration( ModeController controller, MindMap map ) {
        this.controller = (MindMapController) controller;
    }

    /**
     * Enqueue a node for initialization processing
     */
    /*pkg*/ static void enqueueForInit( MindMapNode node ) {
        synchronized( initQueue ) {
            initQueue.add( node );
        }
    }
    
    /**
     * Enqueue a node for classpath processing
     */
    /*pkg*/ static void enqueueForClasspath( MindMapNode node ) {
        synchronized( classpathQueue ) {
            classpathQueue.add( node );
        }
    }
        
    /**
     * Add a URL to the classloader
     */
    public static synchronized void addClassPathURL( URL url ) {
        if( knownURLs.contains( url ) ) return;
        
        knownURLs.add( url );
        baseLoader.addURL( url );
    }
    
    /**
     * Call into the Clojure code 
     */
    public static Object callClojure( String fnName, Object arg ) throws Exception {
        Thread.currentThread().setContextClassLoader( baseLoader );
        return RT.var( CLOJURE_NS, fnName ).invoke( arg );
    }

    /**
     * Get a Clojure Var
     */
    public static Var getVar( String namespace, String name ) {
        Thread.currentThread().setContextClassLoader( baseLoader );
        return RT.var( namespace, name );
    }

    /**
     * @see freemind.extensions.HookRegistration#register()
     */
    @SuppressWarnings("unchecked")
    public void register() {
        logger.info( "Clojure register" );

        //process classpath hook nodes
        synchronized( classpathQueue ) {
            List<MindMapNode> others = new ArrayList<MindMapNode>();
            
            while( ! classpathQueue.isEmpty() ) {
                MindMapNodeModel node = (MindMapNodeModel) classpathQueue.removeFirst();
                if( node.getModeController() == this.controller ) {
                    ClojureClassPathHook.processNode( node );
                }
                else {
                    others.add( node );
                }
            }
            
            //put back nodes from other maps
            classpathQueue.addAll( others );
        }
        
        //process init hook nodes
        synchronized( initQueue ) {
            List<MindMapNode> others = new ArrayList<MindMapNode>();
            
            while( ! initQueue.isEmpty() ) {
                MindMapNodeModel node = (MindMapNodeModel) initQueue.removeFirst();
                if( node.getModeController() == this.controller ) {
                    for( MindMapNode child : (List<MindMapNode>) node.getChildren() ) {
                        logger.info( "Initialization script: " + child.getText() );
                        try {
                            callClojure( "init-node", child );
                        }
                        catch( Exception ex ) {
                            ex.printStackTrace();
                        }                        
                    }
                }
                else {
                    others.add( node );
                }
            }
            
            //put back nodes from other maps
            initQueue.addAll( others );
        }
        
        //add a listener to the mindmap model
        listener = new TreeModelListener() {
            @Override public void treeNodesChanged( TreeModelEvent e ) {
                Object[] path = e.getPath();
                MindMapNode node = (MindMapNode) path[path.length - 1];
                
                if( handleHookCommand( node ) ) return;
                
                try {
                    callClojure( "on-node-change", node );
                }
                catch( Exception ex ) {
                    ClojureRegistration.logger.warning( "Clojure Exception: " + ex.getMessage() );
                    node.setText( "Clojure Exception: " + ex.getMessage() );
                    controller.nodeRefresh( node );
                }            
            }
            @Override public void treeNodesInserted( TreeModelEvent e ) {
                //nothing
            }
            @Override public void treeNodesRemoved( TreeModelEvent e ) {
                //nothing
            }
            @Override public void treeStructureChanged( TreeModelEvent e ) {
                //nothing
            }
        };
        
        controller.getMap().addTreeModelListener( listener );
    }

    /**
     * Handle a hook command on a node
     * 
     * @return true if a command was handled
     */
    private boolean handleHookCommand( MindMapNode node ) {
        String text = node.getText();
        
        if( "/classpath".equals( text ) ) {
            addHook( node, "clojure_classpath_hook", "classpath", "wizard", Color.blue );
            return true;
        }
        else if( "/init".equals( text ) ) {
            addHook( node, "clojure_init_hook", "initialize", "wizard", Color.blue );
            return true;            
        }
        else if( "/save".equals( text ) ) {
            addHook( node, "clojure_save_hook", "save", "wizard", Color.blue );
            return true;
        }
        else if( "/hook".equals( text ) ) {
            addHook( node, "clojure_hook", "default hook", "bookmark", null );
            return true;
        }

        return false;
    }
    
    /**
     * Install a node hook
     */
    public void addHook( MindMapNode node, String name, String text, String iconName, Color color ) {
        NodeHook hook = controller.createNodeHook( name, node, node.getMap() );
        node.setText( text );
        if( color != null ) node.setColor( color );
        if( iconName != null ) {
            while( ! node.getIcons().isEmpty() ) node.removeIcon( 0 ); //clear the icons
            node.addIcon( MindIcon.factory( iconName ), 0 );
        }

        node.invokeHook( hook );        
        controller.nodeRefresh( node );
    }
    
    /**
     * @see freemind.extensions.HookRegistration#deRegister()
     */
    public void deRegister() {
        logger.info( "Clojure deregister" );
        
        if( listener != null ) {
            controller.getMap().removeTreeModelListener( listener );
            listener = null;
        }
    }
}