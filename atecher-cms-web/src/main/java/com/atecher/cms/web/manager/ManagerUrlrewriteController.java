package com.atecher.cms.web.manager;

import com.atecher.cms.common.model.Page;
import com.atecher.cms.common.model.PaginationRequest;
import com.atecher.cms.model.manager.RewriteRule;
import com.atecher.cms.service.manager.IUrlRewirteService;
import com.atecher.cms.web.common.GenericActionController;
import com.atecher.cms.web.util.Constants;
import com.atecher.cms.web.util.Message;
import com.atecher.cms.web.util.UrlRewriterUtil;
import com.atecher.cms.web.util.WebForwardConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value = "/admin/urlrewrite")
public class ManagerUrlrewriteController extends GenericActionController {
    @Autowired
    private IUrlRewirteService urlRewirteService;

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return WebForwardConstants.FWD_MANAGER_URLREWRITE;
    }

    @RequestMapping(value = "/data", method = RequestMethod.POST)
    @ResponseBody
    public Page<RewriteRule> getUrlRewrites(PaginationRequest pagination, @RequestParam(value = "search", required = false) String search) {
        HashMap<String, Object> params = new HashMap<>();
        String sort = pagination.getSort();
        if (!StringUtils.isEmpty(sort)) {
            params.put("sort", sort);
            params.put("order", pagination.getOrder());
        }
        params.put("search", search);
        return urlRewirteService.queryUrlRewirteForPage(pagination.getPageNo(), pagination.getLimit(), params);
    }

    @RequestMapping("/add")
    public String add() {
        return WebForwardConstants.FWD_MANAGER_URLREWRITE_EDIT;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Long id, Model model) {
        RewriteRule rewriteRule = urlRewirteService.get(id);
        model.addAttribute("rewriteRule", rewriteRule);
        return WebForwardConstants.FWD_MANAGER_URLREWRITE_EDIT;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("rewriteRule") RewriteRule rewriteRule, HttpServletRequest request, Model model) {
        if (rewriteRule != null) {
            if (rewriteRule.getId() == null) {
                RewriteRule check = urlRewirteService.check(rewriteRule.getUrlFrom());
                if (check == null) {
                    urlRewirteService.insert(rewriteRule);
                    model.addAttribute(Constants.BIZ_MESS, Message.SUCCESS("提示：Url重写新增成功！"));
                    rewriteRule();
                } else {
                    model.addAttribute(Constants.BIZ_MESS, Message.ERROR("提示：UrlFrom已经存在！"));
                    model.addAttribute("rewriteRule", rewriteRule);
                }
            } else {
                RewriteRule check = urlRewirteService.check(rewriteRule.getUrlFrom());
                if (check != null) {
                    if (check.getId().equals(rewriteRule.getId())) {
                        urlRewirteService.update(rewriteRule);
                        model.addAttribute(Constants.BIZ_MESS, Message.SUCCESS("提示：Url重写修改成功！"));
                        rewriteRule();
                    } else {
                        model.addAttribute(Constants.BIZ_MESS, Message.ERROR("提示：UrlFrom已经存在！"));
                        model.addAttribute("rewriteRule", rewriteRule);
                        return WebForwardConstants.FWD_MANAGER_URLREWRITE_EDIT;
                    }
                } else {
                    urlRewirteService.update(rewriteRule);
                    model.addAttribute(Constants.BIZ_MESS, Message.SUCCESS("提示：Url重写修改成功！"));
                    rewriteRule();
                }
            }
        } else {
            model.addAttribute(Constants.BIZ_MESS, Message.ERROR("提示：提交数据为空！"));
            return WebForwardConstants.FWD_MANAGER_URLREWRITE_EDIT;
        }
        return index();
    }

    @RequestMapping("/remove/{id}")
    public String delete(@PathVariable("id") Long id, HttpServletRequest request, Model model) {
        urlRewirteService.delete(id);
        model.addAttribute(Constants.BIZ_MESS, Message.SUCCESS("提示：Url重写删除成功！"));
        rewriteRule();
        return WebForwardConstants.FWD_MANAGER_URLREWRITE_EDIT;
    }

    private void rewriteRule() {
        List<RewriteRule> list = urlRewirteService.list();
        UrlRewriterUtil.rewriteConf(Constants.getValue("URLREWIRITER_CONF_PATH"), list);
    }
}
