public class customselect2

{

    public String CityList { get; set; }

    public Boolean dis { get; set; }

    public String countriesSelectList { get; set; }

    public String country { get; set; }
    
      public String city { get; set; }
  
    
   
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
    public List<SelectOption> CityList() {
        List<SelectOption> options = new List<SelectOption>();
   
        Map<String, City__c> cities = new Map<String, City__c>();
        for(City__c city : allcity.values()) {
            if (city.Country__c == this.country) {
                cities.put(city.name,city);
            }
        }
        
      
        List<String> cityNames = new List<String>();
        cityNames.addAll(cities.keySet());
        cityNames.sort();
        
       
        for (String cityName : cityNames) {
            City__c city = cities.get(cityName);
            options.add(new SelectOption(cityName,cityName));
        }
        
       
        if (options.size() > 0) {
            options.add(0, new SelectOption('', '-- Select One --'));
        } else {
            options.add(new SelectOption('', 'Not Required'));
        }
        return options;
    }     
        Map<String,City__c> allcity = City__c.getAll();

    
    }