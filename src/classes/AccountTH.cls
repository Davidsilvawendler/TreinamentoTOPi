public virtual with sharing class AccountTH extends TriggerHandler{

    List <Account> newAccounts;
    
    Map <Id, Account> oldAccounts;

    AccountFilter filter;

    
    AccountValidator validator;

    public AccountTH (){
        this ( (List<Account>) Trigger.new, (Map<Id, Account>)Trigger.oldMap);
    }

    public AccountTH(List<Account> newAccounts, Map<Id, Account> oldAccounts){

        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

        this.filter = new AccountFilter();
        this.validator = new AccountValidator(); 
    }
    override
    public void beforeInsert(){
        validateDocumentNumber ();
    }


    override
    public void beforeUpdate(){
        validateDocumentNumber ();
    }

    virtual
    public void validateDocumentNumber (){
        List<Account> filterAccounts = this.filter.filterByChangedDocumentNumber (newAccounts, oldAccounts);
        this.validator.validateDocumentNumber(filterAccounts);
    }

    List<Account> newAccounts;

    AccountFilter filter;

    AccountEnricher enricher;

    public AccountTH() {
        this ( (List<Account>) Trigger.new );
    }

    public AccountTH (List<Account> newAccounts) {
        this.newAccounts = newAccounts;

        this.filter = new AccountFilter();
        this.enricher = new AccountEnricher();
    }

    virtual
    override
    public void afterInsert() {
        enrichIfCategoryPremiumAndMillionAnnualRevenue();
    }

    virtual
    public void enrichIfCategoryPremiumAndMillionAnnualRevenue() {
        List<Account> filteredAccounts = this.filter.filterByCategoryPremiumAndMillionAnnualRevenue(newAccounts);

        this.enricher.enrichEventsWithAccounts(filteredAccounts);
    }

}