function x = gd(x0,paras,eps,maxIterNum,plotfig)
% gradient descent method
% x0: initial point
% paras: parameters in function
% eps: stop bound
% maxIterNum: max number of iteration

if isempty(eps)
    eps = 1e-8;
end
if isempty(maxIterNum)
    maxIterNum = 1e3;
end
if isempty(plotfig)
    plotfig = 1;
end

x = x0;
for it = 1:maxIterNum
    % gradient
    grad = grad_fun(x,paras);
    % search direction
    d = -grad;  
    % step length
    s = armijo_step(x,paras,d,grad);
    % renew x
    x = x + s*d;
    % objs
    if plotfig == 1
        objs(it) = fun(x,paras);
    end
    % stop
    if -grad'*d <eps
        break
    end
end

if plotfig == 1
    figure
    plot(objs); grid on; hold on;
end
end

function s = armijo_step(x,paras,d,grad)
    sigma = 0.1;   %����(<1)��ͨ����С
    beta = 0.5;   %�����ٶ�(<1)
    
    s = 1;
    while fun(x,paras) + sigma*s*grad'*d  < fun(x+s*d,paras)   % new fun is not small enough
        s = s*beta;
    end
end