package org.wikimathdb.web.gwt.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.user.client.ui.DockPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.RootPanel;

public class Main implements EntryPoint {
	public void onModuleLoad() {
		RootPanel rootPanel = RootPanel.get();
		DockPanel dockPanel = new DockPanel();
		rootPanel.add(dockPanel);
		dockPanel.add(new Label("Hello World!"), DockPanel.NORTH);
	}
}
