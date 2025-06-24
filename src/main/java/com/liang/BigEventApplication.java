package com.liang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Hello world!
 *
 */
@SpringBootApplication
public class BigEventApplication
{
    public static void main( String[] args )
    {
        System.out.println("无上甚深微妙法  百千万劫难遭遇\n" +
                           "我今见闻得受持  愿解如来真实义\n");
        for(int i=1;i<=7;i++){
            System.out.println(
                            "观自在菩萨．行深般若波罗蜜多时．照见五蕴皆空．度一切苦厄．\n" +
                            "舍利子．色不异空．空不异色．色即是空．空即是色．受想行识．亦复如是．\n" +
                            "舍利子．是诸法空相．不生不灭．不垢不净．不增不减．是故空中无色．无受想行识．无眼耳鼻舌身意．无色声香味触法．\n" +
                            "无眼界．乃至无意识界．无无明．亦无无明尽．乃至无老死．亦无老死尽．无苦集灭道．无智亦无得．\n" +
                            "以无所得故．菩提萨埵．依般若波罗蜜多故．心无挂碍．无挂碍故．无有恐怖．远离颠倒梦想．究竟涅盘．\n" +
                            "三世诸佛．依般若波罗蜜多故．得阿耨多罗三藐三菩提. \n" +
                            "故知般若波罗蜜多．是大神咒．是大明咒．是无上咒．是无等等咒．能除一切苦．真实不虚．\n" +
                            "故说般若波罗蜜多咒．\n" +
                            "即说咒曰．揭谛揭谛．波罗揭谛．波罗僧揭谛．菩提萨婆诃．");
        }
        for (int i=1;i<=21;i++){
            System.out.println("揭谛揭谛．波罗揭谛．波罗僧揭谛．菩提萨婆诃．\n");
        }
        SpringApplication.run(BigEventApplication.class,args);
    }
}
