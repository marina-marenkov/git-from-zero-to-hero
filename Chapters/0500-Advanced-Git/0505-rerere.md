# Git rerere

Documentation: https://git-scm.com/docs/git-rerere

---

## `rerere` = **re**use **re**corded **re**solution

This command **auto resolve** your conflicts for you.  
When you merge branches in some cases you have conflicts. Using rerere you tell git to save the way you resolve the conflicts and apply it next time he run into the same conflict.

---

### Enable the rerere flag

    git config --global rerere.enabled true

`rerere.enabled`
> Activate recording of resolved conflicts, so that identical conflict hunks can be resolved automatically, should they be encountered again. 
> 
> By default, git-rerere is enabled if there is an rr-cache directory under the $GIT_DIR, e.g. if "rerere" was previously used in the repository.

---

### Enable autostage for rerere (not recommanded)

    git config --global rerere.autoUpdate true

`rerere.autoUpdate`
> When set to true, git-rerere **updates the index** with the resulting contents after it cleanly resolves conflicts using previously recorded resolution.   
> 
> Defaults to false.

---

## `gc` & `rerere`
`gc.rerereResolved`
> Records of conflicted merge you resolved earlier are kept for this many days when git rerere gc is run. You can also use more human-readable "1.month.ago", etc. The default is 60 days. 

`gc.rerereUnresolved`
> Records of conflicted merge you have not resolved are kept for this many days when git rerere gc is run. You can also use more human-readable "1.month.ago", etc. The default is 15 days.