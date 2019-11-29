public virtual class Vehicle {
    private String registrationNo;
    private Double speed;
    public static integer i = 10;
    
    public Vehicle(String registrationNo, Double speed) {
        this.registrationNo = registrationNo;
        this.speed = speed;
    }

    public String getRegistrationNo() {
        return registrationNo;
    }

    public void setRegistrationNo(String registrationNo) {
        this.registrationNo = registrationNo;
    }

    public Double getSpeed() {
        return speed;
    }

    public void setSpeed(Double speed) {
        this.speed = speed;
    }
    public virtual void  move(){
        i = 99;
        System.debug('Move method in Vehicle Class');
        System.debug('value of i in Move: ' + i);
    }
    public void afterMove(){
        System.Debug('Value of i in Vehicle.AfterMove() Method is -> ' + i);
    
    }
}