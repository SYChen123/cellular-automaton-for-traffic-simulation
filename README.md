# cellular-automaton-for-traffic-simulation
对STNS模型的实现，不仅实现了NS模型中的内容，还实现了对车辆变道的处理。

程序的主函数是trafficModel_main.m，运行之后会实时地绘制出汽车的行驶情况。

accelerate.m、slow.m、randomslow.m和updatepos.m是STNS模型继承了NS模型中的四个更新车辆运动的规则，分别为加速、减速、随机慢化和位置更新。

changelane.m是STNS模型中车辆变道的规则。

createMap2.m是创建一张地图，基本结构为目字形。

findfrontcar.m是找到某一辆的前方最近的车辆；findcars.m是找到地图中的所有车辆；

switchpos.m是在地图上更新车辆的位置信息；

randcar.m是随机在地图的某些位置上生成车辆，只会在地图初始化的时候用到。

carflow.m是计算每一条路和交叉路口的车流量。
