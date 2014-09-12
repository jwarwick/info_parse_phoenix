# InfoParse (Phoenix version)

Elixir project built with Phoenix and Ecto. Used to display information captured with `info_gather`.

To create a backup of a heroku postgres database:
`heroku pgbackups` to list backups
`heroku pgbackups:destroy <id>` to delete an existing backup
`heroku pgbackups:capture` to capture the current database

To download the capture:
`curl -o latest.dump \`heroku pgbackups:url\``

To import the capture into postgres:
`pg_restore --verbose --clean --no-acl --no-owner -d infogather latest.dump`

## Databases
This project uses two databases `infogather` and `infoparse`. `infogather` holds the raw data dumped from Heroku. It
is not modified. The mix task `db.import` parses the data in the `infogather` database and creates the approriate
records in the `infoparse` database. It is not smart about removing old data, so the `infoparse` database should be
dropped first.

Use ecto migrations to create the appropriate databases and tables:
```
   mix ecto.create InfoGather.Repo
   pg_restore --verbose --clean --no-acl --no-owner -d infogather latest.dump
   mix ecto.drop InfoParse.Repo
   mix ecto.create InfoParse.Repo
   mix ecto.migrate InfoParse.Repo
   mix db.import
```

There is a mix alias `import` which will do all of the `InfoParse` steps:
```
  mix import
```

To view directory:
```
   mix phoenix.start
   (also aliased to `mix server`)
```


