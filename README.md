REPYZ
=====

3D Printable modules for building modular robots

![ScreenShot](https://github.com/Obijuan/REPYZ/raw/master/doc/logo/repyz-logo.jpg)

Introduction
--
REPYZ modules are an evolution of the REPY modules. The new fetures are:

-Simplified structure.  The body is smaller than in previous versions, thanks to the new sevo lower cover, with a fake shaft

- More robust and compact

- It is simmetric (like REPY v2). The caterpillar robots can move face up or face down

- PRO Version. There are two flavors of repyz modules: standar and PRO. The later includes a 608 bearing on the fake shaft for making the rotation very smooth and with no clearance.

More information can be found on this link (in Spanish):

http://www.iearobotics.com/wiki/index.php?title=M%C3%B3dulos_REPYZ

Pictures
--

https://plus.google.com/u/0/photos/109138697406392447933/albums/5878857037837654529


Video
--

  An example of the locomotion of a pith-pitch minimal configuration, composed of two repyz modules (standar version). Video presented by my little daughter Alicia :-)

http://www.youtube.com/watch?v=hIY0V6fK7iY


Bill of materials
--

- The 3 printed parts: body, head and servo lower cover (There are two differents heads, one for the standard and the other for the PRO)

- Servo Futaba 3003
- 1 M8 washer
- 1 608 bearing (optional, only for the pro version)
- 4 M3 nuts
- 4 M3x10mm bolts
- 2 M2x12mm bolts (provided with the servo)

Instructions
--

![ScreenShot](http://www.iearobotics.com/wiki/images/a/a5/Repyz-PRO-module-exploded-view.png)

Assembly process:

https://plus.google.com/u/0/photos/109138697406392447933/albums/5884847018420290209

Electronics
--

  For moving the module all types of electronics can be used. The only requirement is the generation of a PWM signal.

  Examples of electronics:

- Arduino
- Skymega board: http://www.thingiverse.com/thing:14197
   -This is the board I am using because it fits perfectly on the REPYZ module
   
Software
--

  For generating the locomotion of snake robots, I am using sinusoidal generators. More information can be found on my phd dissertation:

   I have implemented the ardusnake library (for arduino and arudino compatible boards). It is very simple to use and understand:

  https://github.com/Obijuan/ArduSnake

  http://www.thingiverse.com/thing:21401

Author
--

-Juan Gonzalez-Gomez (Obijuan)

Credits
--

- David Estevez:  Is the author of the Repy modules v2. Repyz were inspired in Repy v2:
    http://www.dsquaredrobotics.com/wiki/index.php?title=REPY-2.0

- Andres Prieto-Moreno. Is the author of the MY1 modules, in which the repyz are also inspired. He also suggested me the idea of including a lower servo cover with ears for the servos. Because of these ears, the body of the module has been dramatically simplified.

- Gocha is the cat of Carlos Garcia Saura. It is the one that appears on the REPYZ logo


License
--

REPYZ modules are released under the GPL license




