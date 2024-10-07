jsonData='[
    {
      "user": "beecow",
      "password": "KGtRUFwsswQQut0"
    },
    {
      "user": "daimai",
      "password": "hQhDGfwbAOu1n54"
    },
    {
      "user": "dbaaffiliate",
      "password": "6loHZofv2RqCgs1"
    },
    {
      "user": "dbabeehive",
      "password": "gBpvK3jmA8AB1Uy"
    },
    {
      "user": "dbabillinginfo",
      "password": "VOFeg3k8qpCVdSU"
    },
    {
      "user": "dbacallcenter",
      "password": "aAIIF3f0xMRqJd3"
    },
    {
      "user": "dbacashbook",
      "password": "1kSbOksXAn0wyHD"
    },
    {
      "user": "dbacatalog",
      "password": "fYIoxhSLf25SEkU"
    },
    {
      "user": "dbadating",
      "password": "nJiryV5n0A4H0e8"
    },
    {
      "user": "dbafacebook",
      "password": "p6FJHOu2beOVvkx"
    },
    {
      "user": "dbagateway",
      "password": "fjyxcFhU3lrgYhU"
    },
    {
      "user": "dbagoai",
      "password": "mLE0hDenwbXSaEm"
    },
    {
      "user": "dbainventory",
      "password": "sIGZ0zjfTuNiVpo"
    },
    {
      "user": "dbajob",
      "password": "MPuAO4Tt1gAN2Na"
    },
    {
      "user": "dbalazada",
      "password": "mUrpsPpIJxssnzk"
    },
    {
      "user": "dbalivestream",
      "password": "tOngiZ9z9Ry0WM4"
    },
    {
      "user": "dbamail",
      "password": "m58FzaGQFAYDWde"
    },
    {
      "user": "dbamain",
      "password": "27GMMIiAw1jHael"
    },
    {
      "user": "dbamedia",
      "password": "lFAKkUwmPDMNRTk"
    },
    {
      "user": "dbamessage",
      "password": "DOiX992fIDzKK2n"
    },
    {
      "user": "dbaminions",
      "password": "20anga9N2SAbt8y"
    },
    {
      "user": "dbanetservice",
      "password": "WMpbMOCgHLtDOdf"
    },
    {
      "user": "dbanotify",
      "password": "VTQaYY9bdJcwuHu"
    },
    {
      "user": "dbaopenapi",
      "password": "GjXEKBIdoSWKQdS"
    },
    {
      "user": "dbaorder",
      "password": "zjy2CtOALIgebfj"
    },
    {
      "user": "dbapayment",
      "password": "EotzXYsSZ0NZlJL"
    },
    {
      "user": "dbareview",
      "password": "UhtzNktwinnFTjC"
    },
    {
      "user": "dbasms",
      "password": "EesbZXaKLAaXVpb"
    },
    {
      "user": "dbassrstorefront",
      "password": "9DQs1uXkixw6BlZ"
    },
    {
      "user": "dbastore",
      "password": "aLkVYhNHFBeoxid"
    },
    {
      "user": "dbastoreaffiliate",
      "password": "gA106P5b0Ic7q4S"
    },
    {
      "user": "dbatheme",
      "password": "fsKvY62dwHIpW1t"
    },
    {
      "user": "dbatiki",
      "password": "IDg54jdzPdc4KuB"
    },
    {
      "user": "dbatiktok",
      "password": "dPx0MbDdDLjI0Up"
    },
    {
      "user": "dbauser",
      "password": "e2FsOpJ36RgtIye"
    },
    {
      "user": "dbavoucher",
      "password": "wojrMFH3e7MQUtP"
    },
    {
      "user": "dbawallet",
      "password": "Ejd2rcjMgm7v5zM"
    },
    {
      "user": "dbazalo",
      "password": "vhj7SmvCXJkwbrI"
    },
    {
      "user": "devops",
      "password": "MMqCciPszdLdS7f"
    },
    {
      "user": "devopsreadonly",
      "password": "w9DRlUEb0BvQWO2"
    },
    {
      "user": "group_beecow",
      "password": "WDaPhrk6Ue3ZXFf"
    },
    {
      "user": "hoaph",
      "password": "C3OIfo0yu55jO7N"
    },
    {
      "user": "leader_mobile",
      "password": "kNJDJicigmcMq46"
    },
    {
      "user": "linhdd",
      "password": "Ovr3Y1xdxXJR8em"
    },
    {
      "user": "long",
      "password": "yX5BAZMdQ0dzJFV"
    },
    {
      "user": "phuc",
      "password": "uk4PUxmFPYaQdl8"
    },
    {
      "user": "tiendao",
      "password": "pyvT4gbDgSKy1Fg"
    }
  ]'

export PGPASSWORD=$1

for row in $(echo "${jsonData}" | jq -r '.[] | @base64'); do
    _jq() {
     echo "${row}" | base64 --decode | jq -r "${1}"
    }
    
    # OPTIONAL
    # Set each property of the row to a variable
    key=$(_jq '.user')
    value=$(_jq '.password')

    # Utilize your variables
    psql -h localhost -p $2 -U postgres -c "CREATE USER $key WITH PASSWORD '$value';"
done