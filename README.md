Traffic Controller
==================

<h2>Traffic project for Intersections</h2>

This vhdl project simulates the traffics ligts
working as usual with 3 colors for each of the two
semaphores of an intersection: green, yellow and red
It also gives the possibility of extending the time
of two current colors for the use of pedestrians, 
as well as it allows deliberately to turn off the 
lights and let the traffic police to manage the situation.

<h3>Input:</h3>
<ul>
<li>manual</li>
<li>apaga</li>
<li>rst</li>
<li>clock</li>
</ul>
<h3>Ouput:</h3>
<h4>North-South traffic lights:</h4>
<ul>
<li>nsverde</li>
<li>nsambar</li>
<li>nsrojo</li>
</ul>
<h4>West-East traffic lights:</h4>
<ul>
<li>oeverde</li>
<li>oeambar</li>
<li>oerojo</li>
</ul>
<h2>Simulation:</h2>
For simulation purposes in .vwf, please comment the frequency
divisor component in the top file. 



