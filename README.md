# Nyuworker
<img src ="https://github.com/theevilmysteriouspage/nyuworker/blob/main/nyu/logo.png?raw=true" width = 400 height = 400>
A minimalist lightweight Godot text/dialog system. 

I sought out to make my own text system because it was hard to find any barebones text systems for Godot. Essentially, this is meant to be a jack of most of trades (but out of the box master of none) system that you retrofit to your own project. The ideal use for this is simple visual novels, adventure games, and just games with a more novel formatting than what something like <a href= "https://github.com/dialogic-godot/dialogic">Dialogic</a> usually is best paired with.

Features:<br><br>
A general barebones scene that you can easily animate and move around<br><br>
Animated text/dialog with controllable animation speed<br><br>
CG (picture graphic) service which animated transitions<br><br>
Dialog is stored in an array which means no extra file clutter with dialog files (one of the main reasons I made this lol)<br><br>

Anti-Features:<br><br>
No name tags. You just have to put who's speaking in the dialog itself...<br><br>
No pretty dedicated UI...<br><br>
Any scene changing methods or any method outside of the dialog system itself needs to be dealt with BY YOU!!!<br><br>


# Documentation

To get started, just unzip the latest release into your project wherever most suitable and drop nyuworker.tscn into your main scene and you're good to go!

Nyuworker only uses one script for now and I tried to make as much editable in the inspector as possible for easier on the fly property changes that don't affect every other instance of Nyuworker.

![image](https://github.com/user-attachments/assets/dfbf4159-2801-4902-abce-497dfd92ca99)

Inspector properties: 

Text speed - How fast the text scrolls when loading a new line<br>

Text sound file - The sound of the text scroll. (Loading a new sound in the inspector only supports .mp3 audio so you'll need to manually change it in the audiostreamplayer if you want to use other file types)<br>

Size and postion properties - It is what the name says but do note that the pivots for the main scene and the CGs are centered to make the scene itself easy to animate and to make the cg_animation work.<br>

CG animation - Tells it which animation to play when the CG (picture) changes. There are two premade animations which are shutter and implode (type them just like that as seen in above screenshot). If you want more, you can make your own animations<br>
               but they need to take into account that the time it actually changes the picture is halfway into the animation.<br>

Dialog lines - First of three arrays where all the magic happens. Increase the array size for each new line and simply input your dialog.<br><br>
![image](https://github.com/user-attachments/assets/9a9d99c5-727a-4162-bd16-eb0ebbe17351)


Lines to change CG - This array tells it what lines you want to change the picture on. (make sure not to confuse array size for the actual entries)<br><br>
![image](https://github.com/user-attachments/assets/300fdbac-4f73-4286-8ff9-b038374e85ba)

CG list - This array contains all the images you want to progress through with the above array. Make sure you put the images in order of when they should appear or they won't appear at the right time.<br> <br>
![image](https://github.com/user-attachments/assets/9eb86a30-a5ea-417e-bdce-1b6c071ec9bc)


# Credits

Thanks to the Godot Cafe server for when I needed help with something!



