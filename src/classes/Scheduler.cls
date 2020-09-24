public virtual class Scheduler {

    EventRepository repository;

    BusinessHoursCalculator dateCalculator;

    List<Account> newAccounts;

    List<Event> newEvents;

    public Scheduler (List<Account> newAccounts) {
        this.newEvents = new List<Event>();
        this.repository = new EventRepository();
        this.dateCalculator = new BusinessHoursCalculator();

        this.newAccounts = newAccounts;
        prepareEventFromAccount(newAccounts);
    }

    virtual
    public void prepareEventFromAccount(List<Account> newAccounts) {        
        for (Account account : newAccounts) {
            Event event = prepareEvent();
            event = completeEventWithAccountInformation(event, account);

            this.newEvents.add(event);
        }
    }

    public Event prepareEvent() {
        Event event = new Event();

        event.Description = 'Apresentar o portifolio de Produtos para o novo cliente com enfoque em nossa carteira Premium';
        event.Subject = 'Apresentação instucional dos produtos Premium';
        event.ContactType__c = 'Telefônico';

        return event;
    }

    public Event completeEventWithAccountInformation(Event event, Account account) {        
        Datetime eventCreateDate = account.CreatedDate;

        Datetime nextBusinessHour = dateCalculator.getNextBusinessHour(eventDateTime);

        event.StartDateTime = nextBusinessHour;
        event.EndDateTime = nextBusinessHour.addHours(1);

        event.WhatId = account.Id;

        return event;
    }

    public void createEvents() {
        repository.create(this.newEvents);
    }

}