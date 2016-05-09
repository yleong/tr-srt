BEGIN{
   RS="\n\n"; FS="\n"
} 
{
   print $1;
   print $2;
   $1="";
   $2="";
   $0=gensub("'", "'\"'\"'", "g", $0);
   system("./translate_line.sh " "'" $0 "'"); 
   print "";
}

