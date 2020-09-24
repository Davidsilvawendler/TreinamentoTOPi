public class AccountEnricher {

   Scheduler eventScheduler;

    public List<Account> enrichEventsWithAccounts(List<Account> accounts){

        eventScheduler = new Scheduler(accounts);
        eventScheduler.createEvents();

        return accounts;
    }

}