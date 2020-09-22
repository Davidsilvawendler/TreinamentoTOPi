trigger Account on Account (before insert, before update, after insert, after update) {

    newAccountTH().run();
    
}