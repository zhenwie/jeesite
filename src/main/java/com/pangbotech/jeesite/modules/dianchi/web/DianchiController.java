package com.pangbotech.jeesite.modules.dianchi.web;

/**
 * Created by travis on 17-5-19.
 */

import com.thinkgem.jeesite.common.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 测试Controller
 * @author ThinkGem
 * @version 2013-10-17
 */
@Controller
@RequestMapping(value = "${adminPath}/dianchi")
public class DianchiController extends BaseController {

    /**
     * 显示地图
     * @return
     */
    @RequestMapping(value = "map")
    public String showMap() {
        return "modules/dianchi/map";
    }

    /**
     * 显示过程检测分析图表
     * @return
     */
    @RequestMapping(value = "phaseAnalysis")
    public String showPhaseAnalysis() {
        return "modules/dianchi/phaseAnalysis";
    }
}
