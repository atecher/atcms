package com.atecher.cms.web.manager;

import com.atecher.cms.web.common.GenericActionController;
import com.atecher.cms.web.util.ApplicationMonitor;
import com.atecher.cms.web.util.WebForwardConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin/dashboard")
public class ManagerDashboardController extends GenericActionController{

	@RequestMapping(method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("monitor", new ApplicationMonitor());
		return WebForwardConstants.FWD_MANAGER_DASHBOARD;
	}
	
}
