# TestLink v1.9.20 / Apache 2.4.59

## Changes in the TestLink folder
- I have included the `config_db.inc.php` file that has the database creds which doesn't exist in the TestLink folder since TestLink itself fails to make it and write into it. Change the values written in it before building because the docker file will move the file to the TestLink folder.
> [!NOTE]
> Of course, the DataBase has to be setup and ready for use before running the container as explained in the next section. Keep in mind that if TestLink takes you to the login page and the database appears to be empty or you can't login with the creds {username: `admin`, password: `admin`} then remove *line 9* in the dockerfile then build and launch TestLink installation which will let it make the data tables until it throws the error of cannot write to file and then exec into the container to move the edit the file and move it yourself and you can `docker commit` the container after that to make multiple instances of it.
## Modification perhaps needed on the database
- Make a database called `testlink` (or whatever), a user called `testlinkuser` (or whatever) ***WITH A `mysql_native_password` TYPE OF PASSWORD/AUTHENTICATION*** and grant the user the SELECT, INSERT, UPDATE and DELETE privileges (at least). Then you type the creds you used in the `config_db.inc.php` code below replacing the ones written there.
- You may also need to change the variable sql-mode , remove `NO_ZERO_IN_DATE` and `NO_ZERO_DATE`, for the mysql database in case you get the error message `invalid default value for end_exec_ts`.
## The a2start.sh script
- The `a2start.sh` script serves as an entrypoint for the container. I made it in case of you have to modify the apache server within or make any changes that make you override the container's entrypoint. You can `docker commit` then run a new container from the resulting image with that script as an entrypoint to, kind of, revert the entrypoint to the original.
> [!NOTE]
> Commented second line since it is not needed with this dockerfile/build and will throw an error since this build has no mysql database installed in it. Uncomment it when mysql is installed in the container either through dockerfile in first build or manually later after modifying the built container.
## Sources
- [TestLink's code v1.9.20](https://github.com/TestLinkOpenSourceTRMS/testlink-code/tree/1.9.20)
- [.deb packages](https://www.debian.org/distrib/packages#search_packages)
