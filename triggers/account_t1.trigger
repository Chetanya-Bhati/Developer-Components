trigger account_t1 on Account (before insert, before update) {
    for (account a:trigger.new)
        if (a.industry == 'Education')
        a.Description = 'This is Education Account';
}