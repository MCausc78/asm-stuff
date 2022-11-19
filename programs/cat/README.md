# cat

Program for concating files (like /bin/cat)

## Examples

Input:
```bash
./cat test1.txt - test2.txt < cat-banner.sh
```

Output:
```txt
This is file #1.
Second line of file #1.
#!/bin/bash

./cat <<EOF

Just
	a banner
		with tabs.

EOF

Got readed.
Third line of file #2.
```
