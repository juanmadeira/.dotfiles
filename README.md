# dwl-patches
* A general [dwl wiki](https://codeberg.org/dwl/dwl/wiki) is available at the main [dwl] repository.
* This repository is exclusively for dwl PATCHES.

*Note: All patches are user-submitted content. The authors of dwl do not continually monitor them. You are responsible for downloading and reviewing a patch before using it!*

## Reporting Issues
- Issues with existing patches can be generated here in the dwl-patches [issues]. Please be sure to "@" reference the patch author in your issue.

## Contributing Patches to `dwl-patches`
Since dwl follows [suckless](https://suckless.org/) philosophy, it doesn't provide every feature under the sun. To broaden dwl's functionality, one needs to get familiar with the concept of patching. To get your feet wet, consult [the hacking page](https://suckless.org/hacking/) of the suckless website.

Patches should normally target the latest dwl [release].  
If you target an older release, specify that in the `Download` link on your `README.md` page.  
If you target the unstable `main` branch, specify that in the `Download` link on your `README.md` page.

0. Starting from a local clone of [dwl] (not dwl-patches)
1. If you do not have it already, add the remote for the main dwl repository in your local copy and fetch it:
    `git remote add --fetch upstream https://codeberg.org/dwl/dwl`
2. Use git to create a branch for your new patch and hack away creating your patched version of [dwl].
3. In your local clone of dwl, create a .patch file
    `git format-patch upstream/main...<branch-name> --stdout > PATCHNAME.patch`
4. Now fork [dwl-patches] (not dwl) in Codeberg and clone it locally
5. Configure your `dwl-patches` local clone
    `git config --local pull.rebase true`
6. In your local `dwl-patches` clone, add a directory called `patches/PATCHNAME`. Place the `PATCHNAME.patch` you created in step (2) into the `patches/PATCHNAME` directory.
7. Add a `README.md` page to the `PATCHNAME` directory using this template (add/remove sections as you like):
    ```markdown
    ### Description
    Insert a short summary of changes that your patch implements.

    ### Download
    - [git branch](/USERNAME/dwl/src/branch/PATCHNAME) 
	   ^^^^^^^^^^ OPTIONAL: Patchers are no longer obligated to maintain public `dwl` branches devoted to their patches
    - [0.7](/dwl/dwl-patches/raw/branch/main/patches/PATCHNAME/PATCHNAME.patch)
                    Use the ^RAW^ patch link here
	   ^^^ "0.7" is an example. Use the release that your patch targets
	- [main YYYY-MM-DD](/dwl/dwl-patches/raw/branch/main/patches/PATCHNAME/PATCHNAME.patch)
	        ^^^^^^^^^^ Patches targeting the unstable "main" branch include a YYYY-MM-DD indicator
    ### Authors - latest at top
    - [YOUR_NICK](https://codeberg.org/USERNAME)
       ^^^^^^^^^  Codeberg nick is mandatory; other contact methods optional
      your_email@if_you_wish_to.share.it
      your_irc_nick at [Libera IRC dwl channel](https://web.libera.chat/?channels=#dwl)
      your_discord_handle at [dwl Discord](https://discord.gg/jJxZnrGPWN)
    ```
    You may choose to include screenshots (hosted in your patch's subdirectory) in your `README.md`. The process is described [here](https://docs.codeberg.org/markdown/using-images/).

8. Use the Codeberg web interface to send a pull request to [dwl-patches] (NOT to [dwl])
9. WHEN YOUR PULL REQUEST IS APPROVED, your Codeberg account will also be granted commit access to [dwl-patches]. Once you have write access, you can make direct modifications/updates to your patches and you are free to create new patches rather than creating pull requests.

Individuals who have made known that they no longer intend to maintain their patches will have commit access to the [dwl-patches] repository removed.

A returning user who formerly had commit access is welcome to open an issue on [dwl-patches] requesting commit access be reinstated. When doing so, please link to the original issue opened that granted commit access.

## Updating/Modifying/Adopting Existing Patches
- If the existing patch is already being maintained by another author, do not make modifications to it.
- Create an issue at [issues] @mentioning the current maintainer.
- If you receive no reply for seven days, you may assume the patch abandoned and you may adopt the patch.
- Modify the `README.md` with new links for your raw patch and for your git branch.
    - **LEAVE PREVIOUS AUTHOR(S)' NICKS/LINKS INTACT UNDER THE "Authors" HEADING!**
    - Add your own nick/link to the top of the "Authors" list.

## Deprecating Existing Patches
- Patches will not be removed from this archive but may instead be deprecated if the author(s)/maintainer(s) of a patch so desire.
- Please do not open issues or contact maintainers to request deprecation of a patch.
- Deprecation of a patch will only occur if *all* authors or current maintainers of the patch agree to the decision to deprecate.
- In such a circumstance the author(s)/maintainer(s):
    - Will create a commit moving the patch to the `stale-patches` directory
    - May explain in the associated `README.md` any relevant details of the decision to deprecate the patch.
- This process allows current or future users of the patch the option to adopt, modify, or integrate stale/historical code or portions thereof.

## stale-patches
Deprecated or unmaintained patches are held in the [stale-patches] directory.  
Currently, this directory also contains `.md` description files from ancient patches predating the move to Codeberg.

If you have the inclination to revive one of these, please follow the same procedures outlined below for contributing new patches.

In your initial pull request (or in the commit that revives the stale patch if you already have write access), remove the corresponding `.md` file or the patch directory from [stale-patches].

[stale-patches]: https://codeberg.org/dwl/dwl-patches/src/branch/main/stale-patches
[dwl]: https://codeberg.org/dwl/dwl
[dwl-patches]: https://codeberg.org/dwl/dwl-patches
[issues]: https://codeberg.org/dwl/dwl-patches/issues
[release]: https://codeberg.org/dwl/dwl/releases
[Codeberg]: https://codeberg.org

## 
