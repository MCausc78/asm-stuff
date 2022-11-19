# hexdump

Program for dumping files in hex format

## Examples

Input: ```bash
./hexdump en.txt
```

Output: ```txt
   Offset
                      00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
 | 0000000000000000 | 54 68 69 73 20 69 73 20 6A 75 73 74 0A 74 65 78  |         'This is just.tex'
 | 0000000000000010 | 74 20 66 69 6C 65 2E 0A 48 65 78 2D 64 75 6D 70  |         't file..Hex-dump'
 | 0000000000000020 | 65 72 20 72 65 61 64 73 20 74 68 69 73 2E 0A 3A  |         'er reads this..:'
 | 0000000000000030 | 29 0A                                            |         ').'
```

Input: ```bash
./hexdump ru.txt
```

Output: ```txt
   Offset
                      00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
 | 0000000000000000 | D0 AD D1 82 D0 BE 20 D0 BF D1 80 D0 BE D1 81 D1  |         '...... .........'
 | 0000000000000010 | 82 D0 BE 0A D1 82 D0 B5 D0 BA D1 81 D1 82 D0 BE  |         '................'
 | 0000000000000020 | D0 B2 D1 8B D0 B9 20 D1 84 D0 B0 D0 B9 D0 BB 2E  |         '...... .........'
 | 0000000000000030 | 0A 0A 3A 29 0A                                   |         '..:).'
```
