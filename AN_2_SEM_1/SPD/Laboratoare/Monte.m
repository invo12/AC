%integrala de la 0 la 1 din x^2
% n = input('nr incercari');
% c = 0;
% for i = 1:n
%     x = rand;
%     y = rand;
%     if y <= x^2
%         c = c + 1;
%     end
% end
% val = c / n;
% disp(val);

%acul lui Buffon
% n = input('nr incercari');
% c = 0;
% for i = 1:n
%    d = (1/2) * rand;
%    teta = (pi/2) * rand;
%    if d <= (1/2) * sin(teta)
%        c = c + 1;
%    end
% end
% v = n * 2 / c;
% disp(v);

%cercul din patratul unitate
% n = input('nr incercari');
% c = 0;
% for i = 1:n
%     x = -1/2 + rand;
%     y = -1/2 + rand;
%     if(x^2 + y^2 <= 1/4)
%         c = c+1;
%     end
% end
% v = c/n;
% disp(v);

%3a
% n = input('nr incercari');
% c = 0;
% for i = 1:n
%     x = rand;
%     y = rand;
%     if y < sin(pi * x)
%         c = c + 1;
%     end
% end
% v = c/n;
% disp(v);

%3b,ln2
% n = input('nr incercari');
% c = 0;
% for i = 1:n
%     x = rand;
%     y = rand;
%     if y < 1/(1+x)
%         c = c + 1;
%     end
% end
% v = c/n;
% disp(v);

%sin 1
% n = input('nr incercari');
% c = 0;
% for i = 1:n
%     x = rand;
%     y = rand;
%     if y < cos(x)
%         c = c + 1;
%     end
% end
% v = c/n;
%disp(v);

%cos 1
% n = input('nr incercari');
% c = 0;
% for i = 1:n
%     x = rand;
%     y = rand;
%     if y < sin(x)
%         c = c + 1;
%     end
% end
% v = c/n;
% v = 1 - v;
% disp(v);