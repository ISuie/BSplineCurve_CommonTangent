classdef block
    %区间类
    properties
        x1
        x2
        y1
        y2
        h1
        h2
        n1
        n2
        m1
        m2
    end
    methods
        function obj = block(x1,x2,y1,y2,h1,h2,n1,n2,m1,m2)%区间初始值
            obj.x1 = x1;
            obj.x2 = x2;
            obj.y1 = y1;
            obj.y2 = y2;
            obj.h1 = h1;
            obj.h2 = h2;
            obj.n1 = n1;
            obj.n2 = n2;
            obj.m1 = m1;
            obj.m2 = m2;
        end
        function obj = changed_block(obj,x1,x2,y1,y2)%区间有改动时改变区间范围
            obj.x1 = x1;
            obj.x2 = x2;
            obj.y1 = y1;
            obj.y2 = y2;
        end
        function f1 = find_f1(obj)
            f1 = changed_bij(obj.h1,obj.n1,obj.m1,obj.x1,obj.x2,obj.y1,obj.y2);
        end
        function f2 = find_f2(obj)
            f2 = changed_bij(obj.h2,obj.n2,obj.m2,obj.x1,obj.x2,obj.y1,obj.y2);
        end
        function result = check_block_e(obj,e)
            B = [obj.x1,obj.x2,obj.y1,obj.y2];
            result = check_Block(B,e);
        end
        
    end
end