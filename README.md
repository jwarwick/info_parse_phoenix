# InfoParse (Phoenix version)

Elixir project built with Phoenix and Ecto. Used to display information captured with `info_gather`.

To create a backup of a heroku postgres database:
`heroku pgbackups:capture`

To download the capture:
`curl -o latest.dump \`heroku pgbackups:url\``

To import the capture into postgres:
`pg_restore --verbose --clean --no-acl --no-owner -d infogather latest.dump`

## Postgres Setup
This application assumes you have a database `infogather` created which holds the tables defined in the
`info_gather` project.

Use ecto migrations to create the appropriate databases and tables:
```
   mix ecto.create InfoGather.Repo
   mix ecto.rollback InfoGather.Repo
   mix ecto.migrate InfoGather.Repo
   mix db.import
```

To view directory:
```
   mix phoenix.start
```


