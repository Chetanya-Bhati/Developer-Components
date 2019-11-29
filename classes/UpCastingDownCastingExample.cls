Public class UpCastingDownCastingExample{

    Public Static void UpcastingDownCasting(){
    
    Vehicle V1 = New Vehicle('R001', 20);           //Vehicle Class Instant. Vehicle Class instant V1 created.
    V1.Move();                                      //Move() in Vehicle class
    V1.afterMove();                                 // To check static variable i value change in mothod.
    
    Car Maruti = New Car('R002', 50, 2010, 'M111'); // Car Class extending Vehicle. Car class instant Maruti created.
    Maruti.Move();                                  //Move() in Car Class
    
    Vehicle V2 = New Car('R003', 90, 2019, 'M999'); //Upcasting Example.
    V2.Move();                                      //Move() method in UpCasting class
    
    Car BMW = (Car) V2;                             //Down Casting Example. Dwon casting works only once we have Upcasting earlier.
    BMW.Move();                                     //Move() in Down Casting class
    
    }
}