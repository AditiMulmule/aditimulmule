public class customselect {

    public String getCity() {
        return null;
    }


        public String state { get; set; }
    public String country {get; set;} 
     public static Boolean dis { get; set; }  
   
    public List<SelectOption> getCountriesSelectList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', '-- Select One --'));        

        Map<String, Country__c> countries = Country__c.getAll();
        
       
        List<String> countryNames = new List<String>();
        countryNames.addAll(countries.keySet());
        countryNames.sort();
        dis=false;
       
        for (String countryName : countryNames) {
            Country__c country = countries.get(countryName);
            options.add(new SelectOption(countryName,countryName));
        }
        return options;
    }
    
    // To generate the states picklist based on the country selected by user.
    public List<SelectOption> getStatesSelectList() {
        List<SelectOption> options = new List<SelectOption>();
     
        Map<String, City__c> allstates = City__c.getAll();

       
        Map<String, City__c> states = new Map<String, City__c>();
        for(City__c state : allstates.values()) {
            if (state.Country__c == this.country) {
                states.put(state.name, state);
            }
        }
        
      
        List<String> stateNames = new List<String>();
        stateNames.addAll(states.keySet());
        stateNames.sort();
        
       
        for (String stateName : stateNames) {
            City__c state = states.get(stateName);
            options.add(new SelectOption(stateName,stateName));
        }
        
       
        if (options.size() > 0) {
            options.add(0, new SelectOption('', '-- Select One --'));
        } else {
            options.add(new SelectOption('', 'Not Required'));
        }
        return options;
    }
    }