/**
 * Copyright (c) David N Main. All rights reserved.
 */
package anaphor.freemind;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Collection;
import java.util.HashSet;
import java.util.Map;

import nanohttp.NanoHTTPD;
import clojure.lang.Var;
import freemind.extensions.PermanentNodeHookAdapter;
import freemind.modes.MindMapNode;
import freemind.modes.attributes.Attribute;
import freemind.modes.mindmapmode.MindMapController;

public class HttpdNodeHook extends PermanentNodeHookAdapter {
    
    { ClojureRegistration.logger.info( "**** HttpdNodeHook **** " + hashCode() ); }
    
    private static final String DEFAULT_FN   = "anaphor.freemind.http/default-handler";
    private static final String DEFAULT_VIEW = "anaphor.freemind.http/default-view";
    
    private static final String ATTR_FN   = "function";
    private static final String ATTR_VIEW = "view";
    
    private static final int PORT = 3198;
    
    private static final Collection<HttpdNodeHook> hooks = new HashSet<HttpdNodeHook>();
    
    private static HttpServer server;
    
    private String uri;
    
    /**
     * Register a hook instance and start the HTTP server if required
     */
    private static void registerHook( HttpdNodeHook hook ) {
        ClojureRegistration.logger.info( "**** Added HttpdNodeHook " + hook.hashCode() );
        hooks.add( hook );
        
        if( server == null ) {
            ClojureRegistration.logger.info( "Starting HTTP server on port " + PORT );
            try {
                server = new HttpServer();
            }
            catch( IOException e ) {
                ClojureRegistration.logger.severe( "Error starting HTTP server" );
                e.printStackTrace();
            }
        }
    }
    
    /** @see freemind.extensions.HookAdapter#startupMapHook() */
    @Override
    public void startupMapHook() {
        super.startupMapHook();
        registerHook( this );
    }

    /** @see freemind.extensions.PermanentNodeHookAdapter#shutdownMapHook() */
    @Override
    public void shutdownMapHook() {
        super.shutdownMapHook();
        hooks.remove( this );
        ClojureRegistration.logger.info( "**** Removed HttpdNodeHook " + hashCode() );
    }

    /** @see freemind.extensions.PermanentNodeHookAdapter#onUpdateNodeHook() */
    @Override
    public void onUpdateNodeHook() {
        MindMapNode node = getNode();
        uri = node.getPlainTextContent();
        
        if( ! uri.startsWith( "/" ) ) uri = "/" + uri;
        
        //update the hyperlink
        node.setLink( "http://localhost:" + PORT + uri );
        
        setupAttributes();        
        getController().nodeRefresh( node );        
    }

    /**
     * Verify that the required attributes exist
     */
    private void setupAttributes() {
        MindMapNode node = getNode();
        
        MindMapController ctrl = (MindMapController) getController();
        
        if( node.getAttribute( ATTR_FN ) == null ) {
            ctrl.addAttribute( node, new Attribute( ATTR_FN, DEFAULT_FN ) );
        }

        if( node.getAttribute( ATTR_VIEW ) == null ) {
            ctrl.addAttribute( node, new Attribute( ATTR_VIEW, DEFAULT_VIEW ) );
        }
    }
    
    /**
     * Embedded HTTP server
     */
    private static class HttpServer extends NanoHTTPD {

        HttpServer() throws IOException { super( PORT ); }

        /** @see nanohttp.NanoHTTPD#serve(String, String, Map, Map) */
        @Override
        public Response serve( String uri, String method,
                               Map<String, String> header, 
                               Map<String, String> parms ) {
            
            for( HttpdNodeHook hook : hooks ) {
                if( hook.uri == null ) hook.onUpdateNodeHook();
                String nodeURI = hook.uri;
                MindMapNode node = hook.getNode();
                
                if( ! nodeURI.startsWith( "/" ) ) nodeURI = "/" + nodeURI;
                if( uri.equals( nodeURI ) ) {
                    String fnName = node.getAttribute( ATTR_FN );
                    String vwName = node.getAttribute( ATTR_VIEW );
                    
                    Var fn = ClojureRegistration.getVar( fnName );
                    Var vw = ClojureRegistration.getVar( vwName ); 
                    
                    if( fn == null ) return error( "could not find " + fnName );
                    if( vw == null ) return error( "could not find " + vwName );
                    
                    try {
                        String response = (String) ClojureRegistration.callClojure( 
                            "anaphor.freemind.http", "handle-req", 
                            fn, vw, node, uri, method, header, parms );
                        
                        return response( response );
                    }
                    catch( Exception e ) {
                        StringWriter sw = new StringWriter();
                        PrintWriter pw = new PrintWriter( sw );
                        e.printStackTrace( pw );
                        pw.flush();
                        
                        return error( "\nException: " + e.getMessage() + "\n\n" + sw );
                    }
                }
            }
            
            return notFound( "no node with given URL" );             
        }   

        private Response response( String content ) {
            return new Response( NanoHTTPD.HTTP_OK, 
                                 NanoHTTPD.MIME_HTML,
                                 content );
        }
        
        private Response error( String message ) {
            return new Response( NanoHTTPD.HTTP_INTERNALERROR, 
                                 NanoHTTPD.MIME_PLAINTEXT,
                                 "Internal error: " + message );
        }
        
        private Response notFound( String message ) {
            return new Response( NanoHTTPD.HTTP_NOTFOUND, 
                                 NanoHTTPD.MIME_PLAINTEXT,
                                 "Error 404: " + message );
        }
    }
}
