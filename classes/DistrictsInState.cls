Public Class DistrictsInState{
    
    private static list<string> District1 = new list<string> {'Sirohi', 'Pali', 'Sirohi'};
    private static set<string> District1Dist = new set<string> {'Sirohi', 'Pali', 'Sirohi'};
    
    //District1.add(Sirohi'); 
    //District1.add('Pali'); 
    
    private static list<string> District2 = new list<string> {'Gurgaon', 'Faridabad', 'Gurgaon', 'Hissar'};
    private static set<string> District2Dist = new set<string> {'Gurgaon', 'Faridabad', 'Gurgaon', 'Hissar'};
    //District2.add('Gurgaon');
    //District2.add('Faridabad');
    //District2.add('Hissar');
    
    private static list<list<string>> DistrictsInState = new list<list<string>> {District1, District2};
    //DistrictsInState.add(District1);
    //DistrictsInState.add(District2); 
    
    //private static map<string, list<string>> MapStateandDistricts =new map<string, list<string>>();
    private static map<string, list<string>> MapStateandDistricts =new map<string, list<string>> {'Rajasthan' => District1, 'Haryana' => District2};
    //MapStateandDistricts.put('Raj', ('Sirohi1', 'Pali')); 
    //MapStateandDistricts.put('Haryana', District2);
    
    private static map<string, set<string>> MapStateandDistinctDistricts =new map<string, set<string>> {'Rajasthan' => District1Dist, 'Haryana' => District2Dist};

    public static list<list<string>> DistrictsInStateMethod() {
        System.debug('LISTofLIST Example: DistrictsInState -> ' + DistrictsInState);
        System.debug('MapofList Example: MapStateandDistricts ->' + MapStateandDistricts);
        System.debug('MapofSet Example: MapStateandDistinctDistricts ->' + MapStateandDistinctDistricts);
            
            for(list<string> Districts : DistrictsInState){
                system.debug('LISTofLIST Example: Districts -> '+ Districts );
            } 
        system.debug('MapofList Example: State -> Districts ' + MapStateandDistricts.get('Rajasthan'));
        system.debug('MapofList Example: State -> Districts ' + MapStateandDistricts.get('Haryana'));
        system.debug('MapofSet Example: State -> Distinct Districts ' + MapStateandDistinctDistricts.get('Rajasthan'));
        system.debug('MapofSet Example: State -> Distinct Districts ' + MapStateandDistinctDistricts.get('Haryana'));
                
    return DistrictsInState;
    } 
    
}