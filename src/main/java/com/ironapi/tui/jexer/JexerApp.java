package com.ironapi.tui.jexer;

import jexer.TApplication;

public class JexerApp extends TApplication {
	
	public JexerApp() throws Exception {
        super(BackendType.XTERM);

        // Create standard menus for Tool, File, and Window.
        addToolMenu();
        addFileMenu();
        addWindowMenu();
    }

}
