function cp=calc_cp(layer)
load cp.mat
cp=(ptocp*11+stocp*(1+layer))/(12+layer);
end
