# aws-credentials

```bash
$ git clone https://github.com/emilisto/aws-credentials.git ~/.aws
$ source ~/.aws/functions.sh
# Preferably, add the following line to your .{bash,zsh,whatnot}rc
```

Now put your credentials.csv files in ~/.aws/credentials. If you have
the following credentials:

- ~/.aws/credentials/work.csv
- ~/.aws/credentials/home.csv

you can switch between them like this:

```bash
$ aws-credentials work && echo $AWS_ACCESS_KEY
AKIAIVY6VZ6MJWCGH5LQ
$ aws-credentials home && echo $AWS_ACCESS_KEY
AKIAJEHM55B3CG6Y4PGA
```

LICENSE: [GPL](http://www.gnu.org/licenses/gpl.html)
