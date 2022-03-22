# Git - Shortcuts

`gits`       - `git status`
`gita`       - `git add`
`gitc`       - `git commit`
`gitd`       - `git diff`
`gitb`       - `git branch`
`main`       - `git checkout main`
`pushmain`   - `git push origin main`
`pullmain`   - `git pull origin main`
`ggraph`     - `git log --graph --decorate --pretty=oneline`

---

# Git - Aliases

`git uncommit` - `git reset --soft HEAD^`
`git unstage`  - `git reset`
`git staged`   - `git diff --cached`
`git ctags`    - `git !.git/hooks/ctags`

---

# Git - Common Problems

## Move Last X commits to new branch

```
git branch newbranch
git reset --hard HEAD~3 # Move current branch back 3 commits
git checkout newbranch
```