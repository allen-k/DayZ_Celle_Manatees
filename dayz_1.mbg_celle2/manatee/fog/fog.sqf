// This script was written by Yac, reworked by Rockhount, edited by [BSM]SilverShot
// http://www.armaholic.com/page.php?id=13101
// name of unit, should be player
// maximum distance
// minimum distance
// count of clouds
// min size of clouds
// max size of clouds
// height of clouds
// cloud respawn time
// transparency
// cloud color 1,1,1
// cloud remove speed
// minimum cloud life
// maximum cloud life
// effected by find
// wind strength
// random direction period
// random direction inensity
// more direction x,y,z
// start day time
// end day time
//sleep 1; null=[player,300,11,20,5,7,-0.5,0.1,0.45,1,1,1,10,15,20,true,0.2,2.1,0.1,1,2,0,0,24] execFSM "manatee\fog\Fog.fsm";

sleep 1; null=[player,500,2,350,50,90,-0.5,3,0.6,0.8,0.8,0.9,10,20,40,false,0.3,10,0.3,0.5,0.5,0,0.5,23.5] execFSM "manatee\fog\Fog.fsm"; // prison
//sleep 1; null=[player,450,2,300,50,90,-0.6,3,0.4,0.8,0.8,0.9,10,20,40,false,0.3,10,0.3,0.5,0.5,0,0.5,23.5] execFSM "manatee\fog\Fog2.fsm"; // NAF
//sleep 1; null=[player,350,2,300,50,90,-0.6,3,0.4,0.8,0.8,0.9,10,20,40,false,0.3,10,0.3,0.5,0.5,0,0.5,23.5] execFSM "manatee\fog\Fog3.fsm"; // SAF