package com.ironapi.tui.jexer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Main {

	static Logger logger = LoggerFactory.getLogger(Main.class);
	
	public static void main(String[] args) throws Exception {
		JexerApp app = new JexerApp();
		app.run();
		logger.info("done.");
	}
	
	
	
}
