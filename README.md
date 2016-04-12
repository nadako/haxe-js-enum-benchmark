```
PS D:\Code\playground> D:\code\node510\node.exe main.js

┃ description              ┃     ops/sec ┃  error ┃ samples ┃ performance ┃
┃━━━━━━━━━━━━━━━━━━━━━━━━━━┃━━━━━━━━━━━━━┃━━━━━━━━┃━━━━━━━━━┃━━━━━━━━━━━━━┃
┃ array enum construction  ┃  47,063,679 ┃ ±1.50% ┃      92 ┃  71% slower ┃
┃ object enum construction ┃  95,980,481 ┃ ±0.30% ┃      94 ┃  40% slower ┃
┃ anon enum construction   ┃ 160,541,556 ┃ ±0.31% ┃      93 ┃     fastest ┃

┃ description          ┃     ops/sec ┃  error ┃ samples ┃ performance ┃
┃━━━━━━━━━━━━━━━━━━━━━━┃━━━━━━━━━━━━━┃━━━━━━━━┃━━━━━━━━━┃━━━━━━━━━━━━━┃
┃ array enum matching  ┃ 169,571,108 ┃ ±0.31% ┃      91 ┃  20% slower ┃
┃ object enum matching ┃ 187,410,627 ┃ ±0.28% ┃      93 ┃  12% slower ┃
┃ anon enum matching   ┃ 212,009,155 ┃ ±0.33% ┃      95 ┃     fastest ┃
```