/**
 * Copyright (c) David N Main. All rights reserved.
 */
package anaphor.freemind;

import java.awt.Color;
import java.util.List;

import freemind.extensions.PermanentNodeHookAdapter;
import freemind.main.XMLElement;
import freemind.modes.MindIcon;
import freemind.modes.MindMapNode;
import freemind.modes.mindmapmode.MindMapController;

/**
 * A node hook for writing scripts at save time
 *
 * @author nickmain
 */
public class ClojureSaveHook extends PermanentNodeHookAdapter {

    { ClojureRegistration.logger.info( "**** ClojureSaveHook ****" ); }
    
    @SuppressWarnings("unchecked")
    @Override
    public void save( XMLElement xml ) {
        super.save( xml );
        
        for( MindMapNode child : (List<MindMapNode>) getNode().getChildren() ) {        
            try {
                ClojureRegistration.callClojure( "save-node", child );
            }
            catch( Exception e ) {
                e.printStackTrace();
                
                MindMapController controller = (MindMapController) getController();
                MindMapNode errNode = controller.addNewNode( child, 0, child.isLeft() );
                errNode.setText( e.getMessage() );
                errNode.setStateIcon( "error", MindIcon.factory( "messagebox_warning" ).getIcon() );
                errNode.setColor( Color.red );
                controller.nodeRefresh( errNode );
            }
        }
    }
}
