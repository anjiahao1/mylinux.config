#!/bin/env bash 

# 修改 {Username} 为你的用户名
SCR="/home/ajh/Documents/temp"

# 截图
flameshot gui -p $SCR.png

# 图片处理来增强识别率
mogrify -modulate 100,0 -resize 400% $SCR.png 

# 使用 tesseract 识别英文和简体中文 eng+chi_sim
tesseract $SCR.png $SCR &> /dev/null -l eng+chi_sim

# 将识别结果复制到剪贴板
cat $SCR.txt | xclip -selection clipboard

# 删除临时文件
rm $SCR.png $SCR.txt

exit
