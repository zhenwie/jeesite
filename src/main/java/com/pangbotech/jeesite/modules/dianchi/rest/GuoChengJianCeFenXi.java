package com.pangbotech.jeesite.modules.dianchi.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by travis on 17-6-12.
 */
@RestController
@RequestMapping(value = "${adminPath}/dianchi/api")
public class GuoChengJianCeFenXi {
    @RequestMapping("echartShengChengData")
    public EchartData shengChengData() {
        List<String> category = new ArrayList<String>();
        List<Long> serisData0=new ArrayList<Long>();
        serisData0.add(Math.round(Math.random() * 40));
        List<Long> serisData1=new ArrayList<Long>();
        serisData1.add(Math.round(Math.random() * 40));
        List<Long> serisData2=new ArrayList<Long>();
        serisData2.add(Math.round(Math.random() * 40));
        List<Long> serisData3=new ArrayList<Long>();
        serisData3.add(Math.round(Math.random() * 40));

        List<String> legend = new ArrayList<String>(Arrays.asList(new String[] { "总数比较" }));// 数据分组
        List<Series> series = new ArrayList<Series>();// 纵坐标
        series.add(new Series("总数比较", "line", serisData0));
        series.add(new Series("总数比较", "line", serisData1));
        series.add(new Series("总数比较", "line", serisData2));
        series.add(new Series("总数比较", "line", serisData3));

        EchartData data = new EchartData(legend, category, series);
        return data;
    }
}
