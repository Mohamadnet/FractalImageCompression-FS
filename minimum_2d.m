function result=minimum_2d(x)

[hor_min_temp hor_index_temp]=min(min(x,[],1));
[ver_min_temp ver_index_temp]=min(min(x,[],2));

result.hor_index=hor_index_temp;
result.ver_index=ver_index_temp;
result.value=hor_min_temp;
end
