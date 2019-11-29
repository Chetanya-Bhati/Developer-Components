public class Car extends Vehicle {
    private integer manufacturingYear;
    private String modelnumber;

    public Car(String registrationNo, Double speed, integer manufacturingYear, String modelnumber) {
        super(registrationNo, speed);
        this.manufacturingYear = manufacturingYear;
        this.modelnumber = modelnumber;
    }

    public integer getManufacturingYear() {
        return manufacturingYear;
    }

    public String getModelnumber() {
        return modelnumber;
    }

    public void methodcar(){
        System.Debug('in Car method..');
      //  return methodcar();
    }
    
    public override void move(){
       System.Debug('Move method in Car Class');
    }
}