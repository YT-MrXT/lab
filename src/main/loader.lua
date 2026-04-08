  local _0=game local _1=_0:GetService("Players") local _2=_1.LocalPlayer local _3=_0.PlaceId local _4=string.char local
   _5=table.concat local _6=tonumber local _7=tostring local _8=loadstring local _9=math.floor local _a=coroutine local
  function _b(...)local _c={...}local _d=""for _e=1,#_c do _d=_d.._4(_c[_e])end return _d end local
  _f=_b(104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,
  99,111,109,47,114,101,97,108,99,97,116,104,47,108,97,98,47,114,101,102,115,47,104,101,97,100,115,47,109,97,105,110,47,
  115,114,99,47,109,97,105,110,47,120,47,121,47,122,47) local _g=_b(66,105,122,97,114,114,101,76,105,110,101,97,103,101)
   local _h=_b(83,97,105,108,111,114,80,105,101,99,101) local _i=_b(46,108,117,97) local
  _j=_b(71,97,109,101,32,105,115,32,110,111,116,32,115,117,112,112,111,114,116,101,100) local _k={} local function
  _l(_m,_n)for _o,_p in next,_m do _k[_9(_6(_7(_p)))]=_f.._n.._i end end local _q={14890802310,74747090658891} local
  _r={77747658251236,138368689293913,96767841099256,75159314259063,99684056491472,123955125827131} local
  _t={2753915549,85211729168715,4442272183,79091703265657,7449423635,100117331123089} _l(_q,_g) _l(_r,_h)
  _l(_t,_b(66,108,111,120,70,114,117,105,116,115)) local function _s(_t)local _u=_k[_9(_6(_7(_t)))]if _u then local
  _v,_w=pcall(function()return _8(_0:HttpGet(_u))end)if _v and _w then local _x,_y=pcall(_w)end else pcall(function()if
  _2 then _2:Kick(_j)end end)end end local _z=_a.create(function()_s(_3)end) _a.resume(_z)
