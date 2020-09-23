public virtual class Customer {

    public Decimal amount;
    protected Double descount;
    
    String name;
    String status;
    
    CustomerType type;

    //
    List<Contact> contacts = new List<Contact>();

    Set<Contact> createdContacts;

    // index
    Map<String, Contact> regionContacts = new Map<String, Contact> {
        'SP' => new Contact ( FirstName = 'David' )
        , 'SP' => new Contact ( FirstName = 'David' )
    };
    
    Map<String, List<Contact>> contactsByRegion = new Map<String, List<Contact>> {
        'SP' => new List<Contact> { new Contact ( FirstName = 'David' ) }
        , 'SP' => new List<Contact> { new Contact ( FirstName = 'David' ) }
    };
    
    public List<Contact> filterContactsByRegion () {
        
        List<Contact> contacts = new List<Contact>();

        for (Contact contact : this.contacts) {

            if ( contact.Name == 'XXXX' ) {
                contacts.add(contact);
            }

        }

        return contacts;
        
    }

    virtual
    public void save () {

        String value = '';

    }

    enum CustomerType {        
        PRIME, STANDARD, PREMIUM
    }

}