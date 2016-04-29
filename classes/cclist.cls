public class cclist {

   public String city { get; set; }
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
    
 
    public List<SelectOption> getStatesSelectList() {
        List<SelectOption> options = new List<SelectOption>();
        // Find all the states we have in custom settings.
        Map<String, City__c> allstates = City__c.getAll();

      
        Map<String, City__c> states = new Map<String, City__c>();
        for(City__c city : allstates.values()) {
            if (city.Country__c == this.country) {
                states.put(city.name,city);
            }
        }
        
     
        List<String> cityNames = new List<String>();
        cityNames.addAll(states.keySet());
        cityNames.sort();
        
       
        for (String stateName :cityNames) {
            City__c state = states.get(stateName);
            options.add(new SelectOption(stateName,stateName));
        }
        
       
        if (options.size() > 0) {
            options.add(0, new SelectOption(System.Label.Select_one_of_these,System.Label.Select_one_of_these));
        } else {
            options.add(new SelectOption(System.Label.Not_Required, System.Label.Not_Required));
        }
        return options;
    }
    }