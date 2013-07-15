if (isnil ("Destroy")) then 
{
    Destroy = 0;
};
 
if (Destroy==0) then
{
    cutText ["LOOK N DESTROY activated.", "PLAIN"];
    Destroy=1;
}
else
{
    cutText ["LOOK N DESTROY deactivated.", "PLAIN"];
    Destroy=0;
};
 
DestroyIT = "while {Destroy==1} do{cursorTarget setdammage 1;sleep 1.5;};";
 
[] spawn compile DestroyIT;